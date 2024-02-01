//
//  TabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 31.01.2024.
//

import SwiftUI

struct TabBarView: View {
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
            Text("Profile")
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
