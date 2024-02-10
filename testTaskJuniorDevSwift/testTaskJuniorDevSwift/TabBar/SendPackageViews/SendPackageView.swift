//
//  SendPackageView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 07.02.2024.
//

import SwiftUI

struct SendPackageView: View {
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Image("pointWithout")
                    Text("Origin Details")
                        .font(.title3)
                }
                SendFieldView(fieldValue: "", placeholder: "Address")
                SendFieldView(fieldValue: "", placeholder: "State,Country")
                SendFieldView(fieldValue: "", placeholder: "Phone number")
                SendFieldView(fieldValue: "", placeholder: "Others")

                HStack {
                    Image("pointIcon")
                    Text("Origin Details")
                        .alignmentGuide(.leading, computeValue: { _ in 0 }) // Выравнивание с левого края
                        .font(.title3)
                }
                SendFieldView(fieldValue: "", placeholder: "Address")
                SendFieldView(fieldValue: "", placeholder: "State,Country")
                SendFieldView(fieldValue: "", placeholder: "Phone number")
                SendFieldView(fieldValue: "", placeholder: "Others")
                
                HStack {
                    Image("addSquareIcon")
                    Text("Add destination")
                        .foregroundColor(Color("gray1"))
                }

                HStack {
                    Text("Origin Details")
                        .font(.title3)
                }
                SendFieldView(fieldValue: "", placeholder: "Address")
                SendFieldView(fieldValue: "", placeholder: "State,Country")
                SendFieldView(fieldValue: "", placeholder: "Phone number")
                SendFieldView(fieldValue: "", placeholder: "Others")
            }
            HStack {
                Rectangle()
                    .cornerRadius(5)
                    .shadow(radius: 2, x: 0, y: 2)
                    .overlay (
                        VStack {
                            Image("clockIcon")
                            Text("Instant delivery")
                                .foregroundColor(.white)
                        }
                        )
                    .frame(width: 159, height: 75)
                    .foregroundColor(Color("MainColor"))
                
                Rectangle()
                    .cornerRadius(5)
                    .shadow(radius: 2, x: 0, y: 2)
                    .overlay (
                        VStack {
                            Image("calendarIcon")
                            Text("Scheduled delivery")
                                .foregroundColor(Color("gray2"))
                        }
                        )
                    .frame(width: 159, height: 75)
                    .foregroundColor(.white)
            }
        }
        .navigationTitle("Package")
        .navigationBarTitleDisplayMode(.inline)
    }
}
 

#Preview {
    SendPackageView()
}
