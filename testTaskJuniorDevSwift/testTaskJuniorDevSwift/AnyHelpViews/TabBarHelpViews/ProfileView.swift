//
//  ProfileNavigationView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 03.02.2024.
//

import SwiftUI

struct ProfileView: View {
    @State var toggleSwich = false
    @State var user: User
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *), let url = user.avatarUrl {
                AsyncImage(url: URL(string: url))
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
            } else {
                Image("KaneIcon")
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(user.first_name)
                HStack {
                    Text("Current Balance")
                    Text(user.balance ?? "0")
                        .foregroundColor(Color("MainColor"))
                }
            }
            Spacer()
            EyeButtonView(isSecured: false)
        }
    }
}

#Preview {
    ProfileView(user: User.mockUser)
}
