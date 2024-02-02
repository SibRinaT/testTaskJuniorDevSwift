//
//  VerificationOTPView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct VerificationOTPView: View {
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
                    OTPViewiOS15()
                } else {
                    OTPViewiOS14()
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
                        backgroundColor: Color.gray2,
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
