//
//  User.swift
//  testTaskJuniorDevSwift
//
//  Created by Artem on 02.02.2024.
//

import Foundation

struct SignUpUserRequest: Codable {
    var first_name: String
    var phone_number: String
    var email: String
    var password: String
}

struct SignInUserRequest: Codable {
    var email: String
    var password: String
}

struct PassResetRequest: Codable {
    var email: String
}

struct VerifyOtpModel: Codable {
    let email: String
    let otp: String
}

struct SetNewPasswordRequest: Codable {
    let new_password: String
    let token: String
}

struct User: Codable {
    var first_name: String
    var phone: String?
    var email: String
}

struct PassResetToken: Codable {
    let token: String
}

struct NewPassResponse: Codable {
    let email: String
}
