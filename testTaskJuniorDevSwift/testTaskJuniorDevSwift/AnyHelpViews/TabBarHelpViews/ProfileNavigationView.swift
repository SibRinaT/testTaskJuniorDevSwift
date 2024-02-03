//
//  ProfileNavigationView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 03.02.2024.
//

import SwiftUI

struct ProfileNavigationView: View {
    @State var toggleSwich = false

    var body: some View {
        VStack {
            VStack {
                NavigationView {
                    Text("Profile")
                        .foregroundColor(Color("gray2"))
                }
                .frame(height: 70)
                .overlay(
                    Divider()
                        .background(Color.gray) // Цвет черты
                        .padding(.top, 60) // Регулировка отступа от текста
                )
            }
            HStack {
                Image("KaneIcon")
                VStack(alignment: .leading) {
                    Text("Hello Ken")
                        .padding(.bottom, -15)
                    HStack {
                        Text("Current Balance")
                        Text("N10,712:00")
                            .foregroundColor(Color("MainColor"))
                        EyeButtonView(isSecured: false)
                            .padding(.bottom, 30)
                    }
                }
            }
            Toggle("Enable dark Mode", isOn: $toggleSwich)
                .toggleStyle(.switch)
                .padding(.horizontal, 28) // Добавление пустоты с обеих сторон HStack
        }
    }
}

#Preview {
    ProfileNavigationView()
}
