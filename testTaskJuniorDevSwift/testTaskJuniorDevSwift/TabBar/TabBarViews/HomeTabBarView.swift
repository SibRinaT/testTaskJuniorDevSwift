//
//  WalletTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct HomeTabBarView: View {
    var body: some View {
        VStack {
            Rectangle()
                .overlay (
                    HStack {
                        Image("profile")
                    }
                )
            .foregroundColor(Color("MainColor"))
            .frame(height: 100)
            
            Text("What would you like to do")
            
            HStack {
                HomeRectangleView(image: "customerIcon", title: "Customer Care", smallTitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today")
                HomeRectangleView(image: "customerIcon", title: "Send a package", smallTitle: "Request for a driver to pick up or deliver your package for you")
            }
            HStack {
                HomeRectangleView(image: "customerIcon", title: "Fund your wallet", smallTitle: "To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today")
                HomeRectangleView(image: "customerIcon", title: "Chats", smallTitle: "Search for available rider within your area")
            }
          
        }
    }
}

#Preview {
    HomeTabBarView()
}
