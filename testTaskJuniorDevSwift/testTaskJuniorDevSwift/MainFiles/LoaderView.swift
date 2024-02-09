//
//  LoaderScreenView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 08.02.2024.
//

import SwiftUI

struct LoaderView: View {
    @State private var isRotating = 10.0
    var body: some View {
        VStack {
            Image("load3")
                .onAppear {
                            withAnimation(.linear(duration: 3)
                                    .repeatForever(autoreverses: false)) {
                                isRotating = 360.0
                            }
                }
        }
    }
    
}

#Preview {
    LoaderView()
}
