//
//  ForgotPasswordView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            Text("Forgot Password")
                .font(.title)
            Text("Enter your email address")
                .foregroundColor(Color("gray2"))
                .font(.callout)
                .padding(.bottom, 80)
            InputFieldView(title: "Emaild Address", placeholder: "*****@gmail.com", fieldValue: $email)
            
            LargeButton(title: "Send OTP",
                        disabled: email.isEmpty,
                        backgroundColor: Color.blue,
                        foregroundColor: Color.white) {
                print("Hello World")
            }
            VStack {
                NavigationLink(destination: LogInView()) {
                    Group {
                        Text("Remember password? Back to ")
                            .foregroundColor(Color("gray2"))
                        +
                        Text("Sign in")
                            .foregroundColor(Color("MainColor"))
                    }
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        ForgotPasswordView()
    }
    
}
