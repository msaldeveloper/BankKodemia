//
//  ShipDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 05/04/22.
//

import Foundation
import Alamofire
import Combine

let urlShip = Text.Routes.urlBase + Text.Routes.transactions

struct ShipDeposit: Encodable {
    let amount: Int
    let concept: String
    let destinationUser: String
    let type: String
}
//-> DataResponsePublisher<ShipData>
func shipAction(_ amount: Int,_ concept: String, _ type: String, _ token : HTTPHeaders, _ destination: String)-> DataResponsePublisher<ShipData>{
    let deposit = ShipDeposit(amount: amount, concept: concept, destinationUser: destination, type: type)
    let shipPublisher = AF
        .request(urlDeposit,
                method: .post,
                parameters: deposit,
                encoder: JSONParameterEncoder.default,
                 headers: token)
        .validate()
        .publishDecodable(type: ShipData.self)
    return shipPublisher
}

// in case of errors use
//                let decoder = JSONDecoder()
//                do {
//                    let decodedData = try decoder.decode(DepositedData.self, from: fullData.data!)
//                    print(decodedData.success)
//                } catch {
//                    print("an error ->",error)
//                }
