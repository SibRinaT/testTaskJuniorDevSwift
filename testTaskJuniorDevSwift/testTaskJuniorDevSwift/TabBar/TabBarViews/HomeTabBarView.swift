//
//  HomeTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct HomeTabBarView: View {
    @State var user: User

    var body: some View {
        VStack {
            ProfileView(user: user)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color("gray1"))
                .frame(height: 116)
                .padding(.horizontal)
                .overlay(
                    VStack{
                        Text("Top Up")
                            .bold()
                        HStack {
                            VStack {
                                Image("BankIcon")
                                Text("Bank")
                            }
                            VStack {
                                Image("TransferIcon")
                                Text("Transfer")

                            }
                            VStack {
                                Image("CardIcon")
                                Text("Card")
                            }
                        }
                    }
                )
            VStack(alignment: .leading)
             {
                Text("Transaction History")
                     .font(.title2)
                     .bold()
            }
             //testRecnatgles
            ScrollView {
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")
                RectangleProfileView(image: "BankIcon", title: "fadsfads", title2: "safddsaf")

            }

        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        HomeTabBarView(user: User.mockUser)
    }
}
