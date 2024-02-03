//
//  EyeButtonView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 03.02.2024.
//

import SwiftUI

struct EyeButtonView: View {
    @State var isSecured = false
    var body: some View {
        Button(action: {
            isSecured.toggle()
        }) {
            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                .accentColor(.gray)
        }
    }
}

#Preview {
    EyeButtonView()
}
