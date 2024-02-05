//
//  HomeTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct WalletTabBarView: View {
    @State var user: User

    var body: some View {
        VStack {
            Text("") // need to fix
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
                List {
                    ListElementHomeView(transactionValue: "3,000.00", transactionTypeMinus: false, textTransaction: "Delivery fee", dateTransaction: "July 7, 2022")
                    ListElementHomeView(transactionValue: "2,000.00", transactionTypeMinus: true, textTransaction: "Lalalalala", dateTransaction: "July 4, 2022")
                    ListElementHomeView(transactionValue: "3,000.00", transactionTypeMinus: false, textTransaction: "Third Delivery ", dateTransaction: "July 1, 2022")
                    ListElementHomeView(transactionValue: "1,000.00", transactionTypeMinus: true, textTransaction: "Another One", dateTransaction: "July 27, 2022")
                    ListElementHomeView(transactionValue: "2,500.00", transactionTypeMinus: true, textTransaction: "Experts Are The Best", dateTransaction: "July 23, 2022")
                    ListElementHomeView(transactionValue: "3,000.00", transactionTypeMinus: false, textTransaction: "Delivery fee", dateTransaction: "July 17, 2022")
                    }
            }
        .navigationTitle("Wallet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        WalletTabBarView(user: User.mockUser)
    }
}
