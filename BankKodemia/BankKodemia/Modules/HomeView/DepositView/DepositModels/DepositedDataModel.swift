//
//  DepositedData.swift
//  BankKodemia
//
//  Created by Mariela Torres on 05/04/22.
//

import Foundation


// MARK: - ListUsers
struct DepositedData: Codable {
    let success: Bool
    let data: DataClassDeposit
}

// MARK: - DataClass
struct DataClassDeposit: Codable {
    let transaction: TransactionDeposit
    let finalBalance: Double
}

// MARK: - Transaction
struct TransactionDeposit: Codable {
    let _id, concept: String
    let issuer: Issuer
    let type: String
    let amount: Double
    let created_at: String
}

// MARK: - Issuer
struct Issuer: Codable {
    let _id, lastName, name, email: String
}
