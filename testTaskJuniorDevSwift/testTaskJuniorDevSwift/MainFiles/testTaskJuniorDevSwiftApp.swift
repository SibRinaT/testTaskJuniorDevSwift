//
//  testTaskJuniorDevSwiftApp.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 19.12.2023.
//

import SwiftUI

@main
struct testTaskJuniorDevSwiftApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = nil
        appearance.shadowImage = UIImage(named: "shadow")
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
