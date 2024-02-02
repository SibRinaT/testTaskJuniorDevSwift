//
//  User.swift
//  testTaskJuniorDevSwift
//
//  Created by Artem on 02.02.2024.
//

import Foundation

struct SignUpUserRequest: Codable {
    var name: String
    var phone: String
    var email: String
    var password: String
}

struct User: Codable {
    var name: String
    var phone: String
    var email: String
}
