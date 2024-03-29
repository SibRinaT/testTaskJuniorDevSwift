import SwiftUI

struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    var source: Source
    var content: (Source.Output) -> Content
    
    init(source: Source,
         @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.content = content
    }
    
    var body: some View {
        switch source.state {
        case .idle:
            Spacer()
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            LoadingErrorView(error: error, retryHandler: source.load, closeHandler: {})
        case .loaded(let output):
            content(output)
        }
    }
}

