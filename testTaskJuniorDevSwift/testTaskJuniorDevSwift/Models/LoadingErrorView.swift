import SwiftUI

struct LoadingErrorView: View {
    let error: CustomError
    let retryHandler: () -> ()
    let closeHandler: () -> ()
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button("Close") {
                    closeHandler()
                }
            }
            .padding()
            Spacer()
            Text(error.description)
            Button("Load again") {
                retryHandler()
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LoadingErrorView(error: CustomError.noInternet, retryHandler: {}, closeHandler: {})
}
