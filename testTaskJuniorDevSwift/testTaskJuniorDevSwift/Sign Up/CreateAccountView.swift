//
//  CreateAccountView.swift
//  Redi
//
//  Created by Artem on 31.01.2024.
//

import SwiftUI

struct CreateAccountView: View {
    @ObservedObject var viewModel = CreateAccountViewModel()
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var isAgreeWithTerms = false
    
    var body: some View {
        switch viewModel.state {
        case .idle:
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
                        viewModel.userRequest = SignUpUserRequest(first_name: name,
                                                                  phone_number: phone,
                                                                  email: email,
                                                                  password: password)
                        viewModel.load()
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
                .onAppear() {
                    Utils.saveTrueFor(key: .onboarding)
                }
            }
            .padding()
            .navigationBarHidden(true)
        case .loading:
            ProgressView()
        case .failed(let error):
            LoadingErrorView(error: error) {
                viewModel.load()
            }
        case .loaded(let user):
            TabBarView()
        }
        
    }
}

class CreateAccountViewModel: ObservableObject, LoadableObject {
    typealias Output = User
        
    @Published private(set) var state: LoadingState<User>
    @MainActor private let loader = Loader()
    var userRequest: SignUpUserRequest?
    
    init() {
        self.state = .idle
    }
    
    @MainActor func load() {
        guard let userRequest = userRequest else {
            return
        }
        state = .loading
        
        Task {
            do {
                let result = try await loader.signUp(user: userRequest)
                switch result {
                case .success(let user):
                    
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(user) {
                        let defaults = UserDefaults.standard
                        defaults.set(encoded, forKey: "SavedUser")
                    }
                    
                    state = .loaded(user)
                case .failure(let error):
                    print("error")
                    state = .failed(error)
                }
            } catch {
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

