//
//  DepositedData.swift
//  BankKodemia
//
//  Created by Mariela Torres on 05/04/22.
//

import Foundation

// MARK: - DepositedData
struct DepositedData: Codable {
    let success: Bool
    let data: Datum
}

// MARK: - DataClass
struct Datum: Codable {
    let finalBalance: Int
}
