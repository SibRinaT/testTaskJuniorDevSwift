//
//  SignUpView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 30.01.2024.
//

import SwiftUI
struct OnboardingView2: View {
    @State private var currentStep = 0
    
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
                            //first button
                            Button(action: {
                                
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
                                OnboardingView3()
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
                }
            }
        }

#Preview {
    OnboardingView2()
}
