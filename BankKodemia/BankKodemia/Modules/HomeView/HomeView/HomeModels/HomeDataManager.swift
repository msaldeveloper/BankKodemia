//  HomeDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.

import Foundation
import Alamofire
import Combine
let urlGetUserFullProfile = Text.Routes.urlBase+Text.Routes.getUserFullProfile

class GetUserRequest: TokenProtocol {
    func updateToken(token: LoggedInModel){
        print("token send by protocol",token.token)
        tokenReciver(token: token.token)
    }
    
    func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        getUserProfile(headers)
    }
    
    func getUserProfile(_ token : HTTPHeaders ){
        print("this token ",urlGetUserFullProfile,token)
        AF.request(urlGetUserFullProfile,headers: token).response { response in
            debugPrint(response)
        }
    }
}
