//
//  ProfileTabBar.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct ProfileTabBarView: View {
    @State var toggleSwich = false
    
    var body: some View {
        TabView {
            VStack {
                NavigationView {
                    Text("Profile")
                        .foregroundColor(Color("gray2"))
                }
                .shadow(radius: 5, x: 5, y: 2)
                .frame(height: 100)
                HStack {
                    Image("KaneIcon")
                    VStack {
                        Text("Hello Ken")
                        HStack {
                            Text("Current Balance")
                            Text("N10,712:00")
                                .foregroundColor(Color("MainColor"))
                            Image(systemName: "eye.slash")
                                .padding(.bottom, 30)
                        }
                    }
                }
                
                Toggle("Enable dark Mode", isOn: $toggleSwich)
                    .toggleStyle(.switch)
                
                RectangleProfileView(image: "profile", title: "Edit Profile", title2: "Name, phone no, address, email ...")
                RectangleProfileView(image: "certif", title: "Statements & Reports", title2: "Download transaction details, orders, deliveries")
                RectangleProfileView(image: "notification", title: "Notification Settings", title2: "mute, unmute, set location & tracking setting")
                RectangleProfileView(image: "wallet", title: "Card & Bank account settings", title2: "mchange cards, delete card details")
                RectangleProfileView(image: "twoPeople", title: "Referrals", title2: "check no of friends and earn")
                RectangleProfileView(image: "mapCustom", title: "About Us", title2: "know more about us, terms and conditions")
            }
        }
    }
}


#Preview {
    ProfileTabBarView()
}
