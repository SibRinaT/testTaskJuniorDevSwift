//
//  ProfileTabBar.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct ProfileTabBarView: View {
    @State var toggleSwich = false
    @State var user: User
    
    var body: some View {
        TabView {
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileView(user: user)
                        .padding(.vertical)
                    Toggle("Enable dark Mode", isOn: $toggleSwich)
                        .toggleStyle(.switch)
                        .padding(.bottom)
                    RectangleProfileView(image: "profile", title: "Edit Profile", title2: "Name, phone no, address, email ...")
                    RectangleProfileView(image: "certif", title: "Statements & Reports", title2: "Download transaction details, orders, deliveries")
                    RectangleProfileView(image: "notification", title: "Notification Settings", title2: "mute, unmute, set location & tracking setting")
                    RectangleProfileView(image: "wallet", title: "Card & Bank account settings", title2: "mchange cards, delete card details")
                    RectangleProfileView(image: "twoPeople", title: "Referrals", title2: "check no of friends and earn")
                    RectangleProfileView(image: "mapCustom", title: "About Us", title2: "know more about us, terms and conditions")
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationView {
        ProfileTabBarView(user: User.mockUser)
    }
}
