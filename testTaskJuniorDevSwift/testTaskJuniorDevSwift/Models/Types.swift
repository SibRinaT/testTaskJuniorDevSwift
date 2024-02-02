enum CustomError: Error, CustomStringConvertible {
    case noInternet
    case serverError(String)
    
    var description: String {
        switch self {
        case .noInternet:
            return "No internet connection"
        case .serverError(let string):
            return string
        }
    }
}

enum LoadingState<Value> {
    case idle
    case loading
    case failed(CustomError)
    case loaded(Value)
}

protocol LoadableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}

