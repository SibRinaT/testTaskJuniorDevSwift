import Foundation

@MainActor
struct Loader {
    let url = URL(string: "http://127.0.0.1:5000")!
    let acceptableStatusCodes = [200, 201]
    
    func signUp(user: SignUpUserRequest) async throws -> Result<User, CustomError> {
        return try await performRequest(with: user, path: "register")
    }
    
    func signIn(user: SignInUserRequest) async throws -> Result<User, CustomError> {
        return try await performRequest(with: user, path: "login")
    }
    
    func requestPasswordReset(model: PassResetRequest) async throws -> Result<VerifyOtpModel, CustomError> {
        return try await performRequest(with: model, path: "request-password-reset")
    }
    
    func varifyOtp(model: VerifyOtpModel) async throws -> Result<PassResetToken, CustomError> {
        return try await performRequest(with: model, path: "verify-otp")
    }
    
    func setNewPassword(model: SetNewPasswordRequest) async throws -> Result<NewPassResponse, CustomError> {
        return try await performRequest(with: model, path: "set-new-password")
    }
    
    
    private func performRequest<T>(with model: Codable, path: String) async throws -> Result<T, CustomError> where T: Codable {
        let request = try generateRequest(for: path, model: model)
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse,
           !acceptableStatusCodes.contains(where: { $0 == httpResponse.statusCode }) {
            print("Status code: ", httpResponse.statusCode)
            let error = handleServerError(for: data)
            return .failure(error)
        } else {
            let user = try JSONDecoder().decode(T.self, from: data)
            return .success(user)
        }
    }
    
    private func generateRequest(for path: String, model: Codable) throws -> URLRequest {
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(model)
        return request
    }
    
    private func handleServerError(for data: Data) -> CustomError {
        let serverText: String
        if let error = try? JSONDecoder().decode(ServerError.self, from: data) {
            serverText = error.error
        } else {
            let encoded = String(data: data, encoding: .utf8) ?? ""
            serverText = encoded.isEmpty ? "Server error. Check server is running" : encoded
        }
        print("Response: ", serverText)
        return CustomError.serverError(serverText)
    }
}
