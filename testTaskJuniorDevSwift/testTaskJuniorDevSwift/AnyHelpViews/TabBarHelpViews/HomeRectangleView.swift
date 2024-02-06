//
//  HomeRectangleView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 05.02.2024.
//

import SwiftUI

struct HomeRectangleView: View {
    @State var image: String
    @State var title: String
    @State var smallTitle: String
    @State var grayColor: Bool
    var body: some View {
        VStack {
            if grayColor == true {
                Rectangle()
                    .frame(width: 169, height: 169)
                    .foregroundColor(Color("gray1"))
                    .cornerRadius(15)
                    .opacity(0.4)
                
                    .overlay (
                        VStack(alignment:.leading){
                            Image(image)
                            Text(title)
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color("MainColor"))
                            Text(smallTitle)
                                .font(.caption)
                        }
                    )
            } else {
                Rectangle()
                    .frame(width: 169, height: 169)
                    .foregroundColor(Color("MainColor"))
                    .cornerRadius(15)
                
                    .overlay (
                        VStack(alignment:.leading){
                            Image(image)
                            Text(title)
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .foregroundColor(Color("MainColor"))
                            Text(smallTitle)
                                .font(.caption)
                                .foregroundColor(.white)

                        }
                    )
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    HomeRectangleView(image: "customerIcon", title: "Customer Care", smallTitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today", grayColor: false)
}
