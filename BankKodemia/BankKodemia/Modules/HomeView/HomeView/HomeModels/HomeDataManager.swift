//  HomeDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.

import Foundation
import Alamofire
import Combine
let urlGetUserFullProfile = Text.Routes.urlBase+Text.Routes.getUserFullProfile

class GetUserRequest {
    
//    func tokenReciver(token : String){
//        let headers: HTTPHeaders = [
//            "Authorization" : "Bearer "+token,
//            "Accept": "application/json"
//        ]
//        getUserProfile(headers)
//    }
    
    func getUserProfile(_ token : HTTPHeaders )-> DataResponsePublisher<GetUserFullData>{
        print("this token ",urlGetUserFullProfile,token)
        let fullProfile = AF
            .request(urlGetUserFullProfile, headers: token)
            .response { response in
            debugPrint(response)
            }.validate()
            .publishDecodable(type: GetUserFullData.self)
        return fullProfile
    }
}
