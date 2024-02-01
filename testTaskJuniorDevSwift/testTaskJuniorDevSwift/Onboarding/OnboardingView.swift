//
//  OnboardingView3.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 31.01.2024.
//

import SwiftUI
struct OnboardingView: View {
    @State private var currentStep = 0
    
    var body: some View {
        VStack {
            VStack {
                Image("onboardingImage1")
                Text("Real-time Tracking")
                    .foregroundColor(Color("MainColor"))
                    .multilineTextAlignment(.center)
                    .font(Font.title2.weight(.bold))
                Text("Track your packages/items from the \n comfort of your home till final destination")
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
                    
                    NavigationLink(destination: OnboardingView2()) {
                        Text("Next")
                            .frame(maxWidth: 100)
                    }
                    .buttonStyle(LargeButtonStyle(backgroundColor: Color("MainColor"), foregroundColor: .white, isDisabled: false))
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView(content: {
        OnboardingView()
    })
    
}
