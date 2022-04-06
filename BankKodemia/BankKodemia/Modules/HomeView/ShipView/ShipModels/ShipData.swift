//
//  ShipData.swift
//  BankKodemia
//
//  Created by Mario Saldana on 05/04/22.
//

import Foundation

// MARK: - ShipData
struct ShipData: Codable {
    let success: Bool
    let data: ShipDataClass
}

// MARK: - DataClass
struct ShipDataClass: Codable {
    let transaction: ShipTransaction
    let finalBalance: Double
}

// MARK: - Transaction
struct ShipTransaction: Codable {
    let _id, concept: String
    let destinationUser, issuer: ShipDestinationUser
    let type: String
    let amount: Double
    let created_at: String
    }

// MARK: - DestinationUser
struct ShipDestinationUser: Codable {
    let _id, lastName, name, email: String
}
