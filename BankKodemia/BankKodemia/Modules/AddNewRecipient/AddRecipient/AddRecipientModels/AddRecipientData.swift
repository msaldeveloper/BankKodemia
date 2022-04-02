//
//  AddRecipientData.swift
//  BankKodemia
//
//  Created by Mario Saldana on 01/04/22.
//

import Foundation

// MARK: - ListUsers
struct ListUsers: Codable {
    let success: Bool
    let data: ListUserData
}

// MARK: - DataClass
struct ListUserData: Codable {
    let users: [UserData]
}

// MARK: - User
struct UserData: Codable {
    let _id, email, name, lastName: String
}
