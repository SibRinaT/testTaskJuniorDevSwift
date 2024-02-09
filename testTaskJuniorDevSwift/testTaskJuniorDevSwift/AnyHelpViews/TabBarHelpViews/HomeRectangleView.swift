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
    
    @State private var isRectangleTapped = false

    var body: some View {
        VStack {
                Rectangle()
                    .fill(isRectangleTapped ? Color("MainColor") : Color("gray6"))
                    .frame(width: 169, height: 169)
                    .foregroundColor(Color("gray1"))
                    .cornerRadius(15)
                    .onTapGesture {
                               self.isRectangleTapped.toggle()
                           }
                    .overlay (
                        VStack(alignment:.leading){
                            if isRectangleTapped {
                                Image(image)
                                    .foregroundColor(.white)
                                Text(title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Text(smallTitle)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            } else {
                                Image(image)
                                Text(title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color("MainColor"))
                                Text(smallTitle)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                           
                        }
                    )
        }
        .padding(.vertical)
    }
}

#Preview {
    HomeRectangleView(image: "customerIcon", title: "Customer Care", smallTitle: "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today")
}
