//
//  VerificationOTPView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct VerificationOTPView: View {
    @State var sendButtonDisabled = true
    @State var pin = ""
    
    var body: some View {
        VStack() {
            Text("OTP Verification")
                .font(.title)
                .padding(.bottom, 5)
            
            Text("Enter the 6 digit numbers sent to your email")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 40)
            
            Group {
                if #available(iOS 15.0, *) {
                    OTPViewiOS15 { pin in
                        sendButtonDisabled = pin.count != 6
                        self.pin = pin
                    }
                } else {
                    OTPViewiOS14() { pin in
                        sendButtonDisabled = pin.count != 6
                        self.pin = pin
                    }
                }
            }
            .padding(.bottom, 30)
            
            NavigationLink(destination: ForgotPasswordView()) {
                Group {
                    Text("If you didn’t receive code, ")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    
                    + Text("resend")
                        .font(.subheadline)
                        .foregroundColor(Color(.systemBlue))
                }
                .multilineTextAlignment(.center)
            }
            .padding(.bottom, 80)
            
            LargeButton(title: "Set New Password",
                        disabled: sendButtonDisabled,
                        backgroundColor: Color.blue,
                        foregroundColor: Color.white) {
                print("Hello World")
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        VerificationOTPView()
    }
}
