import Foundation

@MainActor
struct Loader {
    let url = "http://127.0.0.1:5000/register"
    let acceptableStatusCodes = [200, 201]
    
    func signUp(user: SignUpUserRequest) async throws -> Result<User, CustomError> {
        return try await performRequest(with: user)
    }
    
    func performRequest<T>(with model: Codable) async throws -> Result<T, CustomError> where T: Codable {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(model)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse,
           !acceptableStatusCodes.contains(where: { $0 == httpResponse.statusCode }) {
            print("Status code: ", httpResponse.statusCode)
            let serverText = String(data: data, encoding: .utf8)
            print("Response: ", serverText ?? "")
            return .failure(CustomError.serverError(serverText))
        } else {
            let user = try JSONDecoder().decode(T.self, from: data)
            return .success(user)
        }
    }
}
