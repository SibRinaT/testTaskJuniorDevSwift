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
            Text("Forgot Password")
                .font(.title)
            Text("Enter your email address")
                .foregroundColor(Color("gray2"))
                .font(.callout)
            InputFieldView(title: "Emaild Address", placeholder: "*****@gmail.com", fieldValue: $email)
            
            LargeButton(title: "Send OTP",
                        backgroundColor: Color.gray,
                        foregroundColor: Color.white) {
                print("Hello World")
            }
            HStack (alignment: .center)
            {
                Text("Remember password? Back to ")
                    .foregroundColor(Color("gray2"))
                NavigationLink(destination: LogInView()) {
                    Text("Sign in")
                        .bold()
                        .frame(maxWidth: 100)
                        .foregroundColor(Color("MainColor"))
                }
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
