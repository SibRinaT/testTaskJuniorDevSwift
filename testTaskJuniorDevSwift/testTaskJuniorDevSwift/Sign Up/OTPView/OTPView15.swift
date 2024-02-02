import SwiftUI

@available(iOS 15.0, *)
struct OTPViewiOS15: View {
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix
    }
    
    @FocusState private var pinFocusState : FocusPin?
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
                    .modifier(OtpModifer(pin:$pinOne))
                    .onChange(of:pinOne) { newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinTwo
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinOne)
                
                TextField("", text:  $pinTwo)
                    .modifier(OtpModifer(pin:$pinTwo))
                    .onChange(of:pinTwo){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinThree
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinOne
                            }
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinTwo)
                
                TextField("", text:$pinThree)
                    .modifier(OtpModifer(pin:$pinThree))
                    .onChange(of:pinThree){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinFour
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinTwo
                            }
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinThree)

                TextField("", text:$pinFour)
                    .modifier(OtpModifer(pin:$pinFour))
                    .onChange(of:pinFour){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinFive
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinThree
                            }
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinFour)
                
                TextField("", text:$pinFive)
                    .modifier(OtpModifer(pin:$pinFive))
                    .onChange(of:pinFive){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinSix
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinFour
                            }
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinFive)
                
                TextField("", text:$pinSix)
                    .modifier(OtpModifer(pin:$pinSix))
                    .onChange(of:pinSix){newVal in
                        if (newVal.count == 0) {
                            pinFocusState = .pinFive
                        }
                        sendPin()
                    }
                    .focused($pinFocusState, equals: .pinSix)
        })
    }
    
    func sendPin() {
        let pin = [pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix].joined()
        completionHandler?(pin)
    }
}

struct OtpFormField15View_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            OTPViewiOS15()
        }
    }
}
