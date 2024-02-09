//
//  CreateAccountView.swift
//  Redi
//
//  Created by Artem on 31.01.2024.
//

import SwiftUI
import Supabase

struct CreateAccountView: View {
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var isAgreeWithTerms = false
    @State var user: User?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Create an account")
                    .font(.title)
                    .padding(.bottom, 5)
                Text("Complete the sign up process to get started")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
                
                InputFieldView(title: "Full name", placeholder: "Ivanov Ivan", fieldValue: $name)
                InputFieldView(title: "Phone number", placeholder: "+7(999)999-99-99", fieldValue: $phone)
                InputFieldView(title: "Email adress", placeholder: "******@gmail.com", fieldValue: $email)
                InputFieldView(title: "Password", placeholder: "******", isSecured: true, fieldValue: $password)
                InputFieldView(title: "Confirm Password", placeholder: "******", isSecured: true, fieldValue: $confirmPassword)
                
                
                HStack {
                    CheckBoxView(checked: $isAgreeWithTerms)
                        .padding(.trailing, 10)
                    NavigationLink(destination: TermsAndConditionsView()) {
                        Group {
                            Text("By ticking this box, you agree to our ")
                                .foregroundColor(Color.gray)
                            + Text("Terms and conditions and private policy")
                                .foregroundColor(Color(.orange))
                        }
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom, 40)
                
                
                let disabled = !isAgreeWithTerms || name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword
                LargeButton(title: "Sign Up",
                            disabled: disabled,
                            backgroundColor: Color.blue,
                            foregroundColor: Color.white) {
                    signUp()
                }
                
                VStack() {
                    NavigationLink(destination: LogInView()) {
                        Group {
                            Text("Already have an account? ")
                                .foregroundColor(Color.gray)
                            + Text("Sign In")
                                .foregroundColor(Color(.blue))
                        }
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: .constant(user != nil)) {
            TabBarView(user: user!)
        }
        .onAppear() {
            Utils.saveTrueFor(key: .onboarding)
        }
    }
    
    private func signUp() {
        Task {
            do {
                try await Service.supabase.auth.signUp(
                    email: email,
                    password: password
                )
            }
            catch {
                print(error)
            }
        }
    }
}


#Preview {
    NavigationView {
        CreateAccountView()
    }
    
}

