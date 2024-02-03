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
                    HStack {
                        Image("KaneIcon")
                            .clipShape(Circle())
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
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    ProfileNavigationView()
}
