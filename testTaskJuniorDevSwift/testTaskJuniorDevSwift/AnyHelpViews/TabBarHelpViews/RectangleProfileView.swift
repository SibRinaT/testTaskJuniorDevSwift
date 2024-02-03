//
//  RectangleProfileView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct RectangleProfileView: View {
    @State var image: String
    @State var title: String
    @State var title2: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 3, x: 0, y: 2)
            VStack {
                HStack {
                    Image(image)
                    VStack (alignment:.leading) {
                        Text(title)
                            .bold()
                        Text(title2)
                            .foregroundColor(Color("gray2"))

                    }
                    .padding(5)
                    Spacer()
                    Image("arrowCustom")
                }
                .padding()
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    RectangleProfileView(image: "profile", title: "notificat", title2: "mute, unmute, set location & tracking setting")
        .padding()
}
