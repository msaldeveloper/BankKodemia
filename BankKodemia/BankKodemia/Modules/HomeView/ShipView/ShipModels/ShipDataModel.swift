//
//  ShipDataModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 05/04/22.
//

import Foundation

// MARK: - ShipData
struct ShipDataModel {
    let success: Bool
    let data: ShipDataClassModel
}

// MARK: - DataClass
struct ShipDataClassModel {
    let transaction: ShipTransactionModel
    let finalBalance: Int
}

// MARK: - Transaction
struct ShipTransactionModel {
    let _id, concept: String
    let destinationUser, issuer: ShipDestinationUserModel
    let type: String
    let amount: Int
    let created_at: String
    }

// MARK: - DestinationUser
struct ShipDestinationUserModel {
    let _id, lastName, name, email: String
}
