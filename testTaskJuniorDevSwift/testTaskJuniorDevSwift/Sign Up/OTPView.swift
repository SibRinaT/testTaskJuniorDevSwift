import SwiftUI
import Combine

struct OtpModifer: ViewModifier {
    @Binding var pin : String
    
    func limitText() {
        if pin.count > 1 {
            self.pin = String(pin.suffix(1))
        }
    }
        
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) {_ in limitText()}
            .frame(width: 45, height: 45)
            .background(Color.white)
            .background(
                Rectangle()
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
}


struct OTPViewiOS14: View {
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    @State var pinSix: String = ""
    
    var body: some View {
        HStack(spacing: 15, content: {
                TextField("", text: $pinOne)
                    .modifier(OtpModifer(pin:$pinOne))
                TextField("", text:  $pinTwo)
                    .modifier(OtpModifer(pin:$pinTwo))
                TextField("", text:$pinThree)
                    .modifier(OtpModifer(pin:$pinThree))
                TextField("", text:$pinFour)
                    .modifier(OtpModifer(pin:$pinFour))
                TextField("", text:$pinFive)
                    .modifier(OtpModifer(pin:$pinFive))
                TextField("", text:$pinSix)
                    .modifier(OtpModifer(pin:$pinSix))
        })
    }
}

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
        
    var body: some View {
        HStack(spacing: 15, content: {
                TextField("", text: $pinOne)
                    .modifier(OtpModifer(pin:$pinOne))
                    .onChange(of:pinOne){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinTwo
                        }
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
                    }
                    .focused($pinFocusState, equals: .pinFive)
                
                TextField("", text:$pinSix)
                    .modifier(OtpModifer(pin:$pinSix))
                    .onChange(of:pinSix){newVal in
                        if (newVal.count == 0) {
                            pinFocusState = .pinFive
                        }
                    }
                    .focused($pinFocusState, equals: .pinSix)
        })
    }
}

struct OtpFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            OTPViewiOS15()
        } else {
            OTPViewiOS14()
        }
    }
}
