import Foundation

@MainActor
struct Loader {
    let url = URL(string: "http://127.0.0.1:5000")!
    let acceptableStatusCodes = [200, 201]
    
    func signUp(user: SignUpUserRequest) async throws -> User {
        let data = try await performRequest(with: user, path: "register")
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func signIn(user: SignInUserRequest) async throws -> User {
        let data = try await performRequest(with: user, path: "login")
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func requestPasswordReset(model: PassResetRequest) async throws -> VerifyOtpModel {
        let data = try await performRequest(with: model, path: "request-password-reset")
        return try JSONDecoder().decode(VerifyOtpModel.self, from: data)
    }
    
    func varifyOtp(model: VerifyOtpModel) async throws -> PassResetToken {
        let data = try await performRequest(with: model, path: "verify-otp")
        return try JSONDecoder().decode(PassResetToken.self, from: data)
    }
    
    func setNewPassword(model: SetNewPasswordRequest) async throws -> NewPassResponse {
        let data = try await performRequest(with: model, path: "set-new-password")
        return try JSONDecoder().decode(NewPassResponse.self, from: data)
    }

    
    private func performRequest(with model: Codable, path: String) async throws -> Data {
        let request = try generateRequest(for: path, model: model)
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse,
           !acceptableStatusCodes.contains(where: { $0 == httpResponse.statusCode }) {
            print("Status code: ", httpResponse.statusCode)
            throw handleServerError(for: data)
        } else {
            return data
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
