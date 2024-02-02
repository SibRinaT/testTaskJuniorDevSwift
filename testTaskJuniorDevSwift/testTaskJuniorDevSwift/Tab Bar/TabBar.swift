//
//  TabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 31.01.2024.
//

import SwiftUI

struct TabBarView: View {
    @State var toggleSwich = false
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            Text("Wallet")
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Wallet")
                }
            Text("Track")
                .tabItem {
                    Image(systemName: "car")
                    Text("Track")
                }
            VStack {
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
           
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")

                }
        }
    }
}

#Preview {
    TabBarView()
}
