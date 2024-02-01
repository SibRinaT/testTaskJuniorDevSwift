//
//  SwiftUIView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Welcome back")
                .font(.title)
            Text("Fill your email and password to continue")
                .foregroundColor(Color("gray2"))
                .font(.callout)
            
            InputFieldView(title: "Email address", placeholder: "*****@gmail.com", fieldValue: "")
            InputFieldView(title: "Password", placeholder: "******", isSecured: true, fieldValue: "")
            
            HStack {
                Text("Remember password")
                    .foregroundColor(Color("gray2"))
                    .font(.callout)
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .font(.caption2)
                        .bold()
                        .frame(maxWidth: 100)
                        .foregroundColor(Color("MainColor"))
                }
            }
            LargeButton(title: "Log In",
                        backgroundColor: Color.gray,
                        foregroundColor: Color.white) {
                print("Hello World")
            }
        }
        HStack {
            Text("Already have an account?")
                .foregroundColor(Color("gray2"))
            NavigationLink(destination: ForgotPasswordView()) {
                Text("Next")
                    .bold()
                    .frame(maxWidth: 100)
                    .foregroundColor(Color("MainColor"))
            }
        }
        Text("or log in using")
                .foregroundColor(Color("gray2"))
        Image("Vector")
    }
}

#Preview {
    LogInView()
}
