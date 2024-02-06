//
//  WalletTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct HomeTabBarView: View {
    var body: some View {
        VStack{
            Rectangle()
                .overlay (
                    HStack {
                        Image("profile")
                        VStack (alignment: .leading){
                            Text("Hello Ken!")
                                .foregroundColor(.white)
                            Text("We trust you are having a great time")
                                .font(.caption2)
                                .foregroundColor(Color("gray1"))
                        }
                        Image("notificationIcon")

//                        Circle()
//                            .foregroundColor(Color("circleColor"))
//                            .position(CGPoint(x: 35.0, y: 120.0))
//                            .frame(height: 122)
//                        Circle()
//                            .foregroundColor(Color("circleColor"))
//                            .position(CGPoint(x: 160.0, y: 20.0))
//                            .frame(height: 122)
                    }
                )
                .clipped()
            .foregroundColor(Color("MainColor"))
            .frame(height: 91)
            .padding(.horizontal)
            Text("What would you like to do")
            
            HStack {
                HomeRectangleView(image: "customerIcon", title: "Customer Care", smallTitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", grayColor: true)
                HomeRectangleView(image: "boxIcon", title: "Send a package", smallTitle: "Request for a driver to pick up or deliver your package for you", grayColor: true)
            }
            HStack {
                    HomeRectangleView(image: "walletHomeIcon", title: "Fund your wallet", smallTitle: "To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today", grayColor: false)
                    HomeRectangleView(image: "chatIcon", title: "Chats", smallTitle: "Search for available rider within your area", grayColor: false)
            }
          
        }
    }
}

#Preview {
    HomeTabBarView()
}
