//
//  InputFieldView.swift
//  Redi
//
//  Created by Artem on 31.01.2024.
//

import SwiftUI

struct InputFieldView: View {
    let title: String
    let placeholder: String
    @State var isSecured = false
    @State var fieldValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.gray)
                .font(.caption)
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField("aadsv", text: $fieldValue)
                            .font(.caption2)
                    } else {
                        TextField("aadsv", text: $fieldValue)
                            .font(.caption2)
                    } 
                }
                .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
                .padding(.trailing, 5)
                .opacity(isSecured ? 1: 0)
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    InputFieldView(title: "Full name", placeholder: "Ivanov Ivan", isSecured: true, fieldValue: "")
}
