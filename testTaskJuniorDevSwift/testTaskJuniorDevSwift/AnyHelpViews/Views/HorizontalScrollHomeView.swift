//
//  HorizontalScrollHomeView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 06.02.2024.
//

import SwiftUI

struct HorizontalScrollHomeView: View {
    @State var image1: String
    @State var image2: String
    @State var image3: String
    @State var image4: String


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                Rectangle()
                    .overlay(
                        Image(image1)
                    )
                    .cornerRadius(10)
                    .frame(width: 166, height: 64)
                Rectangle()
                    .overlay(
                        Image(image2)
                    )
                    .cornerRadius(10)
                    .frame(width: 166, height: 64)
                Rectangle()
                    .overlay(
                        Image(image3)
                    )
                    .cornerRadius(10)
                    .frame(width: 166, height: 64)
                Rectangle()
                    .overlay(
                        Image(image4)
                    )
                    .cornerRadius(10)
                    .frame(width: 166, height: 64)
            }
            .padding()
        }
    }
}

#Preview {
    HorizontalScrollHomeView(image1: "ad1", image2: "ad2", image3: "", image4: "")
}
