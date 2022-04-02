//
//  LoginInDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation
import Alamofire
import Combine

let urlBase = "https://bankodemia.kodemia.mx/auth/login?expires_in=1h"
struct Login: Encodable {
    let email: String
    let password: String
}

func loginApp(_ testEmail: String,_ testPassword: String) -> DataResponsePublisher<LoggedInData>{
    let login = Login(email: testEmail, password: testPassword)
    let loginPublisher = AF
        .request(urlBase,
                method: .post,
                parameters: login,
                encoder: JSONParameterEncoder.default)
        .validate()
        .publishDecodable(type: LoggedInData.self)
    return loginPublisher
}
