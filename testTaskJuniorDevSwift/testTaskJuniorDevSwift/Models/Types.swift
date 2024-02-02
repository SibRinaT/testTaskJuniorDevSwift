enum CustomError: Error {
    case noInternet
}

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

protocol LoadableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
