//
//  ChatsView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 06.02.2024.
//

import SwiftUI

struct ChatView: View {
    @State var user: User
    @State var userText: String
    var body: some View {
        VStack {
            Rectangle()
                .overlay(
                    HStack {
                        if #available(iOS 15.0, *), let url = user.avatarUrl {
                            AsyncImage(url: URL(string: url))
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                        } else {
                            Image("KaneIcon")
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading) {
                            Text(user.first_name)
                            Text(userText)
                        }
                        .foregroundColor(.black)
                    }
                )
                .frame(height: 85)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color.gray))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ChatView(user: User.mockUser, userText: "Thanks for your service")
}
