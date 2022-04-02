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
    let amount: Double
    let type, concept, createdAt: String
    let issuer, destinationUser: User
    let isIncome: Bool
}

// MARK: - User
struct UserModel {
    let _id, email, name, lastName: String
}
