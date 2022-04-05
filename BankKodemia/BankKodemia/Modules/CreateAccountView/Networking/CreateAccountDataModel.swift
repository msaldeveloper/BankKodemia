//
//  CreateDataModel.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation

// MARK: - CreatedData
struct CreatedData: Codable {
    let success: Bool
    let data: DataClassSignup
}

// MARK: - DataClass
struct DataClassSignup: Codable {
    let user: UserSignup
}

// MARK: - User
struct UserSignup: Codable {
    let identityImageType, identityImage: String
    let isPhoneVerified: Bool
    let phone, password, birthDate, occupation: String
    let lastName, name, email, _id: String
}

