//
//  ListElementHomeView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 05.02.2024.
//

import SwiftUI

struct ListElementHomeView: View {
    @State var transactionValue: String
    @State var transactionTypeMinus: Bool
    @State var textTransaction: String
    @State var dateTransaction: String
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading){
                    if transactionTypeMinus == false {
                        Text("-" + "N" + transactionValue)
                            .foregroundColor(.red)
                            .bold()
                    } else {
                        Text("N" + transactionValue)
                            .foregroundColor(.green)
                            .bold()
                    }
                    Text(textTransaction)
                        .bold()
                }
                Spacer()
                Text(dateTransaction)
            }
        }
    }
}

#Preview {
    ListElementHomeView(transactionValue: "3,000.00", transactionTypeMinus: false, textTransaction: "Delivery free", dateTransaction: "July 7,2022")
}
