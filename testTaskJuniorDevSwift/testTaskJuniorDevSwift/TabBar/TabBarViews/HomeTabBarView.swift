//
//  HomeTabBarView.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 02.02.2024.
//

import SwiftUI

struct HomeTabBarView: View {
    var body: some View {
        VStack {
         
            
            VStack {
                ProfileView()
                Rectangle()
                    .foregroundColor(Color("gray2"))
                    .frame(width: 200, height: 120)
            }
           
        }
    }
}

#Preview {
    HomeTabBarView()
}
