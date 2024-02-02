import Foundation

@MainActor
struct Loader {

    func signUp(user: SignUpUserRequest, result: @escaping (Result<[User], CustomError>) -> Void) {
    }
}
