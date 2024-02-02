import SwiftUI

struct OTPViewiOS14: View {
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    @State var pinSix: String = ""
    
    var completionHandler: ((String) -> ())?
    
    var body: some View {
        HStack(spacing: 30, content: {
            TextField("", text: $pinOne)
                .modifier(OtpModifer(pin: $pinOne))
                .onChange(of: pinOne) { _ in
                    sendPin()
                }
            
            TextField("", text:  $pinTwo)
                .modifier(OtpModifer(pin: $pinTwo))
                .onChange(of: pinTwo) { _ in
                    sendPin()
                }
            
            TextField("", text:$pinThree)
                .modifier(OtpModifer(pin: $pinThree))
                .onChange(of: pinThree) { _ in
                    sendPin()
                }
            
            TextField("", text:$pinFour)
                .modifier(OtpModifer(pin: $pinFour))
                .onChange(of: pinFour) { _ in
                    sendPin()
                }
            
            TextField("", text:$pinFive)
                .modifier(OtpModifer(pin: $pinFive))
                .onChange(of: pinFive) { _ in
                    sendPin()
                }
            
            TextField("", text:$pinSix)
                .modifier(OtpModifer(pin: $pinSix))
                .onChange(of: pinSix) { _ in
                    sendPin()
                }
        })
    }
    
    func sendPin() {
        let pin = [pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix].joined()
        completionHandler?(pin)
    }
}

struct OtpFormField14View_Previews: PreviewProvider {
    static var previews: some View {
        OTPViewiOS14()
    }
}
