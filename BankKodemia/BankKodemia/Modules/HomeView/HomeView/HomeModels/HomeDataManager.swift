//  HomeDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.

import Foundation
import Alamofire
import Combine

let urlGetUserFullProfile = Text.Routes.urlBase+Text.Routes.getUserFullProfile

class GetUserRequest {
    
    func getUserProfile(_ token : HTTPHeaders )->DataResponsePublisher<GetUserFullData>{
        print("this token ",urlGetUserFullProfile,token)
        return AF
            .request(urlGetUserFullProfile, method: .get, headers: token)
            .validate()
            .publishDecodable(type: GetUserFullData.self)
    }
}

