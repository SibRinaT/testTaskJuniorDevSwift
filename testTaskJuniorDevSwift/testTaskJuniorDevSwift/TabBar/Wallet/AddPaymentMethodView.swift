//
//  AddPaymentMethodView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 05.02.2024.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @State var isSelected: Bool
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 100)
                .shadow(radius: 2, x: 0, y: 2)
                .overlay(
                    HStack {
                        
                            Text("Option 1")
                                   
                        VStack {
                            Text("Pay with wallet")
                            Text("complete the payment using your e wallet")
                        }
             
                    }
     

                )
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    AddPaymentMethodView(isSelected: false)
}
