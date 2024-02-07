//
//  SwiftUIView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 01.02.2024.
//

import SwiftUI
import Supabase

struct LogInView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State var email = ""
    @State var password = ""
    
    fileprivate func makeView() -> some View {
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
                
                let req = SignInUserRequest(email: email, password: password)
                viewModel.userRequest = req
                viewModel.load()
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
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            makeView()
        case .loading:
            ProgressView()
        case .failed(let customError):
            LoadingErrorView(error: customError) {
                viewModel.load()
            } closeHandler: {
                viewModel.state = .idle
            }
        case .loaded(let user):
            TabBarView(user: user)
        }
    }
}


class LoginViewModel: ObservableObject, LoadableObject {
    typealias Output = User
    
    @Published var state: LoadingState<User>
    @MainActor private let loader = Loader()
    var userRequest: SignInUserRequest?
    
    init() {
        self.state = .idle
    }
    
    @MainActor func load() {
        guard let userRequest = userRequest else {
            return
        }
        state = .loading
        Task {
            Task {
                do {
                    let session = try await Service.supabase.auth.signIn(
                        email: "test@test.ru",
                        password: "123456"
                        )
                        print(session)
                }
            }
        }
    }
}


#Preview {
    NavigationView {
        LogInView()
    }
}

