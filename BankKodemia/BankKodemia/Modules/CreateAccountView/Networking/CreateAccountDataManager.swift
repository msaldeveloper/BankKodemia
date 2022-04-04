//
//  CreateAccountDataManager.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation
import Alamofire
import Combine

let urlBases = "https://bankodemia.kodemia.mx/users"
struct CreateAccount: Encodable {
    let email: String
    let name: String
    let birthDate: String
    let password: String
    let phone: String
    let identityImage: String
    let identityImageType: String
    let occupation: String
}

func createApp(_ testEmail: String,_ testName: String,_ testBirthDate: String,_ testPassword: String,_ testPhone: String,_ testIdentityImage: String,_ testIdentityImageType: String,_ testOccupation: String
) -> DataResponsePublisher<LoggedInData>{
    let CreateAccount = CreateAccount(
        email: testEmail,
        name: testName,
        birthDate: testBirthDate,
        password: testPassword,
        phone: testPhone,
        identityImage: testIdentityImage,
        identityImageType: testIdentityImageType,
        occupation: testOccupation
    )
    let createPublisher = AF
        .request(urlBase,
                method: .post,
                parameters: CreateAccount,
                encoder: JSONParameterEncoder.default)
        .validate()
        .publishDecodable(type: LoggedInData.self)
    return createPublisher
}
