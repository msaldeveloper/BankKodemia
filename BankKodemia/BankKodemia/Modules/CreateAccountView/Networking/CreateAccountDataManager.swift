//
//  CreateAccountDataManager.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation
import Alamofire
import Combine

let urlCreateAccount = Text.Routes.urlBase+Text.Routes.listUsers
struct CreateAccount: Encodable {
    let email: String
    let name: String
    let lastName: String
    let birthDate: String
    let password: String
    let phone: String
    let identityImage: String
    let identityImageType: String
    let occupation: String
        
}
//-> DataResponsePublisher<CreatedData>
func createApp(_ testEmail: String,_ testName: String,_ testlastName: String,_ testBirthDate: String,_ testPassword: String,_ testPhone: String,_ testIdentityImage: String,_ testIdentityImageType: String,_ testOccupation: String
)-> DataResponsePublisher<CreatedData> {
    let CreateAccount = CreateAccount(
        email: testEmail,
        name: testName,
        lastName: testlastName,
        birthDate: testBirthDate,
        password: testPassword,
        phone: testPhone,
        identityImage: testIdentityImage,
        identityImageType: testIdentityImageType,
        occupation: testOccupation
    )
    //print(CreateAccount)
    let createPublisher = AF
        //AF
        .request(urlCreateAccount,
                method: .post,
                parameters: CreateAccount,
                 encoder: JSONParameterEncoder.default)
    .validate()
    .publishDecodable(type: CreatedData.self)
    return createPublisher
}


    // in case of errors use
    //            let decoder = JSONDecoder()
    //            do {
    //                let decodedData = try decoder.decode(CreatedData.self, from: responseData.data!)
    //                print(decodedData.success)
    //            } catch {
    //                print("an error ->",error)
    //            }
    //        }
