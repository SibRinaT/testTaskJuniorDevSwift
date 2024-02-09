//
//  ChatsMainView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 09.02.2024.
//

import SwiftUI

struct ChatsMainView: View {
    var body: some View {
        VStack {
            ChatView(user: User.mockUser, userText: "ghjasddsa")
        }
        .navigationTitle("Chats")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatsMainView()
}
