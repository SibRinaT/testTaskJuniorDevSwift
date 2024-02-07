//
//  SendFieldView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 07.02.2024.
//

import SwiftUI

struct SendFieldView: View {
    @State var fieldValue: String
    let placeholder: String

    var body: some View {
        TextField(placeholder, text: $fieldValue)
            .font(.callout)
            .textFieldStyle(.roundedBorder)
            .shadow(radius: 2, x: 0, y: 2)
    }
}

#Preview {
    SendFieldView(fieldValue: "", placeholder: "Address")
}
