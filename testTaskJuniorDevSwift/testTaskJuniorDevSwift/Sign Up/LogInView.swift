//
//  SwiftUIView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI

struct LogInView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Welcome back")
                .font(.title)
            Text("Fill your email and password to continue")
                .foregroundColor(Color("gray2"))
                .font(.callout)
            
            InputFieldView(title: "Email address", placeholder: "*****@gmail.com", fieldValue: $email)
            InputFieldView(title: "Password", placeholder: "******", isSecured: true, fieldValue: $password)
            
            HStack {
                Text("Remember password")
                    .foregroundColor(Color("gray2"))
                    .font(.callout)
                Spacer()
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
            
            VStack {
                NavigationLink(destination: CreateAccountView()) {
                    Group {
                        Text("Don't have an account? ")
                            .foregroundColor(Color("gray2"))
                        + Text("Sign Up")
                            .foregroundColor(Color(.orange))
                    }
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                }
                .padding(.bottom, 10)
                Text("or log in using")
                        .foregroundColor(Color("gray2"))
                Image("Vector")
            }
            .frame(maxWidth: .infinity, alignment: .center)

        }
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    NavigationView {
        LogInView()
    }
}
