//
//  VerificationOTPView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct VerificationOTPView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("OTP Verification")
                    .font(.title)
                    .padding(.bottom, 5)
                
                Text("Enter the 6 digit numbers sent to your email")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
            }
            VStack (alignment: .leading) {
                HStack {
                    
                    NavigationLink(destination: ForgotPasswordView()) {
                        Group {
                            Text("If you didn’t receive code, ")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            
                            + Text("resend")
                                .font(.subheadline)
                                .foregroundColor(Color(.systemBlue))
                        }
                        .multilineTextAlignment(.leading)
                        
                        
                        
                    }
                }
            }
            LargeButton(title: "Send OTP",
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
