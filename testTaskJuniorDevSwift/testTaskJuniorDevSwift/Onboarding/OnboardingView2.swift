//
//  SignUpView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 30.01.2024.
//

import SwiftUI
struct OnboardingView2: View {
//    @State private var isOnboardingCompleted: Bool = false
    var body: some View {
        VStack {
            VStack {
                Image("onboardingImage2")
                Text("Flexible Payment")
                    .foregroundColor(Color("MainColor"))
                    .multilineTextAlignment(.center)
                    .font(Font.title2.weight(.bold))
                Text("Different modes of payment either \n before and after delivery \n without stress")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("blackColor"))
                    .font(.system(size: 16))
                
                HStack {
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Skip")
                            .frame(maxWidth: 100)
                    }
                    .buttonStyle(LargeButtonStyle(backgroundColor: .white, foregroundColor: Color("MainColor"), isDisabled: false))
                    
                    Spacer()
                    
                    NavigationLink(destination: OnboardingView3()) {
                        Text("Next")
                            .frame(maxWidth: 100)
                    }
                    .buttonStyle(LargeButtonStyle(backgroundColor: Color("MainColor"), foregroundColor: .white, isDisabled: false))
                }
            }
        }
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    NavigationView {
        OnboardingView2()
    }
}
