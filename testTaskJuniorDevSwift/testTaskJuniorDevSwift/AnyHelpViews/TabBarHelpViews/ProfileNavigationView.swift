//
//  ProfileNavigationView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 03.02.2024.
//

import SwiftUI

struct ProfileView: View {
    @State var toggleSwich = false
    
    var body: some View {
        HStack {
            Image("KaneIcon")
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Hello Ken")
                HStack {
                    Text("Current Balance")
                    Text("N10,712:00")
                        .foregroundColor(Color("MainColor"))
                }
            }
            EyeButtonView(isSecured: false)
        }
    }
}

#Preview {
    ProfileView()
}
