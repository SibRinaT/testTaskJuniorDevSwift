//
//  OnboardingView3.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 31.01.2024.
//

import SwiftUI
struct OnboardingView3: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image("onboardingImage2_1")
            Text("Real-time Tracking")
                .foregroundColor(Color("MainColor"))
                .multilineTextAlignment(.center)
                .font(Font.title2.weight(.bold))
            Text("Track your packages/items from the \n comfort of your home till final destination")
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("blackColor"))
                .font(.system(size: 16))
            
            Spacer()
            NavigationLink(destination: CreateAccountView()) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: Color("MainColor"), foregroundColor: .white, isDisabled: false))
        }
        .padding()
    }
}

#Preview {
    OnboardingView3()
}
