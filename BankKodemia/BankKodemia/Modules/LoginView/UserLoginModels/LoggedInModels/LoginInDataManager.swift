//
//  LoginInDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation
import Alamofire
import Combine

//class LoginInDataManager{
//
//}

let urlBase = "https://bankodemia.kodemia.mx/auth/login?expires_in=1h"
private var loginViewModel = LoginViewModel()
struct Login: Encodable {
    let email: String
    let password: String
}



func loginApp(_ testEmail: String,_ testPassword: String) -> DataResponsePublisher<LoggedInData>{
    let login = Login(email: testEmail, password: testPassword)
    let publisher = AF
        .request(urlBase,
               method: .post,
               parameters: login,
                 encoder: JSONParameterEncoder.default)
        .validate()
        .publishDecodable(type: LoggedInData.self)
//        .response { response in
//            debugPrint(response)
//            let responseLogin = String(bytes: response.data!, encoding: .utf8)
//            print("response --> ", responseLogin ?? "")
//            let statusCode = response.response?.statusCode
//            print( statusCode ?? "")//status code
//            let result = response.data
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(LoggedInData.self, from: result!)
//                print(decodedData.token)
//                let token = decodedData.token
//                let time = decodedData.expiresIn
//                let login = LoggedInModel(token: token, expiresIn: time)
//                print(login)
//                loginViewModel.tokenReciver(accessToken: login.token)
//            } catch {
//                print("this is an error ---> ",error)
//            }
//        }
    return publisher
}







//        .response { response in
//        debugPrint(response)
//        print("response data -->",String(bytes: response.data!, encoding: .utf8))//code of response
//        var tokenResponse : String =  String(bytes: response.data!, encoding: .utf8) ?? ""
//        print("token response -->",tokenResponse)
//        print(tokenResponse)
//            print( response.response?.statusCode ?? "")//status code
//        }
