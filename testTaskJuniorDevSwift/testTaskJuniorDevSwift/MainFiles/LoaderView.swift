//
//  LoaderScreenView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 08.02.2024.
//

import SwiftUI

struct LoaderView: View {
    @State private var isRotating = false
    var body: some View {
        VStack {
            Image("load3")
                .rotationEffect(.degrees(isRotating ? -360 : 0))
                .animation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false))
                .onAppear {
                    self.isRotating.toggle()
                }
            }
        }
    }

#Preview {
    LoaderView()
}
