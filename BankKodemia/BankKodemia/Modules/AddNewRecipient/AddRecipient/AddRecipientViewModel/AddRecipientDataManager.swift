//
//  AddRecipientDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 01/04/22.
//

import Foundation
import Alamofire
import Combine
let urlListUserRequest = Text.Routes.urlBase+Text.Routes.listUsers

class ListUserRequest {
    func getUserData(_ token : HTTPHeaders )->DataResponsePublisher<ListUsers>{
       return AF
            .request(urlListUserRequest, method: .get, headers: token)
            .response { fullData in
                debugPrint(fullData)
            }
            .validate()
            .publishDecodable(type: ListUsers.self)
                    
    }
}

// in case of errors use
//let decoder = JSONDecoder()
//do {
//
//    let decodedData = try decoder.decode(ListUsers.self, from: fullData.data!)
//    print(decodedData.data.users[0].name)
//
//} catch {
//    print("an error ->",error)
//}
