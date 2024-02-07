//
//  RectangleProfileHomeView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 06.02.2024.
//

import SwiftUI

struct RectangleProfileHomeView: View {
    var body: some View {
        Rectangle()
            .overlay (
                HStack {
                        Circle()
                            .foregroundColor(Color("circleColor"))
                            .position(CGPoint(x: 35.0, y: 120.0))
                            .frame(height: 122)
                        Circle()
                            .foregroundColor(Color("circleColor"))
                            .position(CGPoint(x: 160.0, y: 10.0))
                            .frame(height: 122)
                }
            )
            .cornerRadius(10)
            .clipped()
        .foregroundColor(Color("MainColor"))
        .frame(height: 91)
        .padding(.horizontal)
    }
}

#Preview {
    RectangleProfileHomeView()
}
