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
    
    var body: some View {
        switch viewModel.state {
        case .idle:
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
                    
                    
                    InputFieldView(title: "Full name", placeholder: "Ivanov Ivan", fieldValue: name)
                    InputFieldView(title: "Phone number", placeholder: "+7(999)999-99-99", fieldValue: "")
                    InputFieldView(title: "Email adress", placeholder: "******@gmail.com", fieldValue: "")
                    InputFieldView(title: "Password", placeholder: "******", isSecured: true, fieldValue: "")
                    InputFieldView(title: "Confirm Password", placeholder: "******", isSecured: true, fieldValue: "")
                    
                    LargeButton(title: "Sign Up",
                                backgroundColor: Color.blue,
                                foregroundColor: Color.white) {
                        print(name)
                        viewModel.userRequest = SignUpUserRequest(name: name,
                                                                  phone: phone,
                                                                  email: email,
                                                                  password: password)
                        viewModel.load()
                    }
                }
            }
            .padding()
            .navigationBarHidden(true)
        case .loading:
            Spacer()
        case .failed(let error):
            Spacer()
        case .loaded(let value):
            Spacer()
        }
        
    }
}


class CreateAccountViewModel: ObservableObject, LoadableObject {
    typealias Output = [User]
        
    @Published private(set) var state: LoadingState<[User]>
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
        
        loader.signUp(user: userRequest) { [weak self] result in
            switch result {
            case .success(let user):
                print("success")
                self?.state = .loaded(user)
            case .failure(let error):
                print("error")
                self?.state = .failed(error)
            }
        }
    }
}

#Preview {
    NavigationView {
        CreateAccountView()
    }
    
}

