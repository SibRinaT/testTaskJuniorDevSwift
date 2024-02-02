import SwiftUI

struct LoadingErrorView: View {
    let error: Error
    let retryHandler: () -> ()
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Something went wrong")
            Button("Load again") {
                retryHandler()
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    LoadingErrorView(error: CustomError.noInternet, retryHandler: {})
}
