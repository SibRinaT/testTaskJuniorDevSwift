//
//  VerificationOTPView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct VerificationOTPView: View {
    var body: some View {
        Text("OTP Verification")
            .font(.title)
            .padding(.bottom, 5)
        Text("Enter the 6 digit numbers sent to your email")
            .font(.subheadline)
            .foregroundColor(.gray)
            .padding(.bottom, 40)
        
        HStack {
            Text("If you didn’t receive code, ")
                .foregroundColor(Color("gray2"))
            NavigationLink(destination: ForgotPasswordView()) {
                Text("resend")
                    .bold()
                    .frame(maxWidth: 100)
                    .foregroundColor(Color("MainColor"))
            }
        }
        
        LargeButton(title: "Send OTP",
                    backgroundColor: Color.gray2,
                    foregroundColor: Color.white) {
            print("Hello World")
        }
      
    }
}

#Preview {
    VerificationOTPView()
}
