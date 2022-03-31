//
//  HomeUserData.swift
//  BankKodemia
//
//  Created by Mario Saldana on 31/03/22.
//

import Foundation

// MARK: - GetUserFullData
struct GetUserFullData: Codable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
    let transactions: [Transaction]
    let balance: Double
}

// MARK: - Transaction
struct Transaction: Codable {
    let id: String
    let amount: Int
    let type, concept, createdAt: String
    let issuer, destinationUser: User
    let isIncome: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case amount, type, concept
        case createdAt
        case issuer, destinationUser, isIncome
    }
}

// MARK: - User
struct User: Codable {
    let id, email, name, lastName: String
    let occupation, birthDate, password, phone: String
    let isPhoneVerified: Bool
    let identityImage, identityImageType: String

    enum CodingKeys: String, CodingKey {
        case id
        case email, name, lastName, occupation, birthDate, password, phone, isPhoneVerified, identityImage, identityImageType
    }
}
