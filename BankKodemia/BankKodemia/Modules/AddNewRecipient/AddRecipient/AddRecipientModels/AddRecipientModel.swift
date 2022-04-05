//
//  AddRecipientModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 04/04/22.
//

import Foundation

import Foundation

// MARK: - ListUsers
struct ListUsersModel {
    let success: Bool
    let data: ListUserData
}

// MARK: - DataClass
struct ListUserDataModel {
    let users: [UserData]
}

// MARK: - User
struct UserDataModel {
    let _id, email, name, lastName: String
}
