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
        Rectangle()
            .foregroundColor(.white)
            .frame(width: 342, height: 60)
            .shadow(radius: 2, x: 0, y: 2)
            .overlay (
                HStack{
                    Image(image)
                    VStack (alignment:.leading) {
                        Text(title)
                            .bold()
                            .font(.system(size: 16)) // Настройка размера шрифта
                        Text(title2)
                            .foregroundColor(Color("gray2"))
                            .font(.system(size: 12)) // Настройка размера шрифта
                    }
                    Spacer() // Добавим Spacer для растягивания элементов до края
                    Image("arrowCustom")
                }
                    .padding(.horizontal) // Добавление пустоты с обеих сторон HStack
                    .padding(.vertical) // Добавление пустоты с обеих сторон HStack
            )
        
    }
}

#Preview {
    RectangleProfileView(image: "profile", title: "notificat", title2: "mute, unmute, set location & tracking setting")
}
