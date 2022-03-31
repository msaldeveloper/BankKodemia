//
//  HomeUserModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 31/03/22.
//

import Foundation

// MARK: - GetUserFullData
struct GetUserFullDataModel {
    let success: Bool
    let data: DataClassModel
}

// MARK: - DataClass
struct DataClassModel {
    let user: UserModel
    let transactions: [TransactionModel]
    let balance: Double
}

// MARK: - Transaction
struct TransactionModel {
    let id: String
    let amount: Int
    let type, concept, createdAt: String
    let issuer, destinationUser: UserModel
    let isIncome: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case amount, type, concept
        case createdAt
        case issuer, destinationUser, isIncome
    }
}

// MARK: - User
struct UserModel {
    let id, email, name, lastName: String
    let occupation, birthDate, password, phone: String
    let isPhoneVerified: Bool
    let identityImage, identityImageType: String

    enum CodingKeys: String, CodingKey {
        case id
        case email, name, lastName, occupation, birthDate, password, phone, isPhoneVerified, identityImage, identityImageType
    }
}
