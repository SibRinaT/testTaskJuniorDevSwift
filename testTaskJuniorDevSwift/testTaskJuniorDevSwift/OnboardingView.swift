//
//  SignUpView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 30.01.2024.
//

import SwiftUI
struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "onboardingImage1", title: "Quick Delivery At Your \n Doorstep", description: "Enjoy quick pick-up and delivery to \n your destination"),
    OnBoardingStep(image: "onboardingImage2", title: "Flexible Payment", description: "Different modes of payment either \n before and after delivery \n without stress"),
    OnBoardingStep(image: "onboardingImage2_1", title: "Real-time Tracking", description: "Track your packages/items from the \n comfort of your home till final destination")
]
struct OnboardingView: View {
    @State private var currentStep = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count) { it in
                    VStack {
                        Image(onBoardingSteps[it].image)
                        Text(onBoardingSteps[it].title)
                            .foregroundColor(Color("MainColor"))
                            .multilineTextAlignment(.center)
                            .font(Font.title2.weight(.bold))
                        Text(onBoardingSteps[it].description)
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("blackColor"))
                            .font(.system(size: 16))
                        
                        HStack {
                            //first button
                            Button(action: {
                                self.currentStep = onBoardingSteps.count - 1
                            }) {
                                Text("Skip")
                                    .bold()
                                    .foregroundColor(Color("MainColor")) // Цвет текста
                                    .padding() // Отступы вокруг текста
                                    .background(Color.clear) // Прозрачный фон
                                    .cornerRadius(10) // Радиус скругления углов
                                    .frame(width: 100, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10) // Обводка кнопки
                                            .stroke(Color("MainColor"), lineWidth: 2) // Цвет и толщина линии
                                    )
                            }
                            .padding(60)
                            //second button
                            Button(action: {
                                if self.currentStep < onBoardingSteps.count - 1 {
                                    self.currentStep += 1
                                } else {
                                    //
                                }
                            }) {
                                Text("Next")
                                    .bold()
                                    .foregroundColor(.white) // Цвет текста
                                    .padding() // Отступы вокруг текста
                                    .frame(width: 100, height: 50)
                                    .background(Color("MainColor")) // Прозрачный фон
                                    .cornerRadius(10) // Радиус скругления углов
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10) // Обводка кнопки
                                            .stroke(Color("MainColor"), lineWidth: 2) // Цвет и толщина линии
                                    )
                            }
                            .padding(60)
                        }
                    }
                    .tag(it)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
