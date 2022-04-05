//
//  DepositDataManager.swift
//  BankKodemia
//
//  Created by Mariela Torres on 05/04/22.
//

import Foundation
import Alamofire
import Combine

let urlDeposit = Text.Routes.urlBase + Text.Routes.transactions

struct Deposit: Encodable {
    let amount: Int
    let concept: String
    let type: String
}

//func depositApp(_ amount: String,_ concept: String, _ type: String) -> DataResponsePublisher<DepositedData>{
//    let deposit = Deposit(amount: String, concept: String, type: String)
//    let depositPublisher = AF
//        .request(urlBase,
//                method: .post,
//                parameters: deposit,
//                encoder: JSONParameterEncoder.default)
//        .validate()
//        .publishDecodable(type: DepositedData.self)
//    return depositPublisher
//}

