//
//  LoggedInModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation

struct LoggedInData: Codable {
    let token: String
    let expiresIn: String
}
