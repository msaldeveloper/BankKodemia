//
//  InvalidCredentialsModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation

struct InvalidCredentialsData: Codable {
    let statusCode: Int
    let message, error: String
}
