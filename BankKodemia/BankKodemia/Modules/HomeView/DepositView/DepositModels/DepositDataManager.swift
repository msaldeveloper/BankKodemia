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
//
func depositAction(_ amount: Int,_ concept: String, _ type: String, _ token : HTTPHeaders)-> DataResponsePublisher<DepositedData>{
    let deposit = Deposit(amount: amount, concept: concept, type: type)
    let depositPublisher = AF
        .request(urlDeposit,
                method: .post,
                parameters: deposit,
                encoder: JSONParameterEncoder.default,
                 headers: token)
        .validate()
        .publishDecodable(type: DepositedData.self)
    return depositPublisher
}

// in case of errors use
//                let decoder = JSONDecoder()
//                do {
//                    let decodedData = try decoder.decode(DepositedData.self, from: fullData.data!)
//                    print(decodedData.success)
//                } catch {
//                    print("an error ->",error)
//                }
