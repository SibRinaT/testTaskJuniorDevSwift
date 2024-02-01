//
//  ContentView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 19.12.2023.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var opacity = 0.5
    @State private var size = 0.8
    @State private var isOnboardingCompleted: Bool = false

    var body: some View {
        NavigationView {
            if isActive {
                if isOnboardingCompleted {
                    OnboardingView3()
                } else {
                    OnboardingView()
                        .navigationBarHidden(true)
                }
            } else {
                VStack {
                    VStack {
                        Image("splashIcon")
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear() {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation() {
                            self.isActive = true
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    SplashView()
}
