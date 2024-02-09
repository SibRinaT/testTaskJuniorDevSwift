//
//  TabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 31.01.2024.
//

import SwiftUI

struct TabBarView: View {
    @State var toggleSwich = false
    @State var user: User
    
    var body: some View {
        TabView {
            NavigationView {
                HomeTabBarView(user: user)
            }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            NavigationView {
                WalletTabBarView(user: user)
            }                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Wallet")
                }
            Text("Track")
                .tabItem {
                    Image(systemName: "car")
                    Text("Track")
                }
            NavigationView {
                ProfileTabBarView(user: user)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
    }
}

#Preview {
    NavigationView {
        TabBarView(user: User.mockUser)
    }
}
