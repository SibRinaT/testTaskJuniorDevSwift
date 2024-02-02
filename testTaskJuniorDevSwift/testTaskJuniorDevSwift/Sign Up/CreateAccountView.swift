//
//  CreateAccountView.swift
//  Redi
//
//  Created by Artem on 31.01.2024.
//

import SwiftUI

struct CreateAccountView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                //                VStack(alignment: .leading) {
                Text("Create an account")
                    .font(.title)
                    .padding(.bottom, 5)
                Text("Complete the sign up process to get started")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
                //                }
                
                
                InputFieldView(title: "Full name", placeholder: "Ivanov Ivan", fieldValue: "")
                InputFieldView(title: "Phone number", placeholder: "+7(999)999-99-99", fieldValue: "")
                InputFieldView(title: "Email adress", placeholder: "******@gmail.com", fieldValue: "")
                InputFieldView(title: "Password", placeholder: "******", isSecured: true, fieldValue: "")
                InputFieldView(title: "Confirm Password", placeholder: "******", isSecured: true, fieldValue: "")
                
                LargeButton(title: "Sign Up",
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    print("Hello World")
                }
            }
        }
        .padding()
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        CreateAccountView()
    }
    
}

