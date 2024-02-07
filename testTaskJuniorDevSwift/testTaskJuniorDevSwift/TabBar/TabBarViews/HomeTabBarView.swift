//
//  WalletTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct HomeTabBarView: View {
    @State var user: User
    var body: some View {
        VStack{
            RectangleProfileHomeView()
                .overlay (
                    HStack {
                        if #available(iOS 15.0, *), let url = user.avatarUrl {
                            AsyncImage(url: URL(string: url))
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 1).foregroundColor(Color.white))
                        } else {
                            Image("KaneIcon")

                        }
                        VStack(alignment: .leading) {
                            Text("Hello " + user.first_name + "!")
                                .bold()
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("We trust you are having a great time")
                                .font(.caption2)
                                .foregroundColor(Color("gray1"))
                        }
                    }
                )
                .cornerRadius(10)
                .clipped()
            .foregroundColor(Color("MainColor"))
            .frame(height: 91)            
            
            VStack(){
                HStack {
                    Text("Special for you")
                    
                        .foregroundColor(.orange)
                }
                HorizontalScrollHomeView(image1: "ad1", image2: "ad2", image3: "ad1", image4: "ad2")
            }
            
            Text("What would you like to do")
            
            HStack {
                HomeRectangleView(image: "customerIcon", title: "Customer Care", smallTitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", grayColor: true)
                HomeRectangleView(image: "boxIcon", title: "Send a package", smallTitle: "Request for a driver to pick up or deliver your package for you", grayColor: true)
            }
            HStack {
                    HomeRectangleView(image: "walletHomeIcon", title: "Fund your wallet", smallTitle: "To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today", grayColor: true)
                    HomeRectangleView(image: "chatIcon", title: "Chats", smallTitle: "Search for available rider within your area", grayColor: false)
            }
          
        }
    }
}

#Preview {
    HomeTabBarView(user: User.mockUser)
}
