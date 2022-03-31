//
//  HomeDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.
//

import Foundation
import Alamofire
import Combine
let urlGetUserFullProfile = Text.Routes.urlBase+Text.Routes.getUserFullProfile
private var loginViewModel = LoginViewModel()
private var cancellables: [AnyCancellable] = []


class GetUserRequest: TokenProtocol {
    var tokenn : HTTPHeaders =  HTTPHeaders()
    func updateToken(token: LoggedInModel){
        print("token send by protocol",token.token)
        tokenReciver(token: token.token)
    }
    
//    func tokenSuscriber(){
//        let tokenResponse = loginViewModel
//            .tokenSender
//            .sink{ newToken in
//                let headers: HTTPHeaders = [
//                    "Authorization": newToken
//                ]
//                self.getUserProfile(headers)
//            }
//    }
    func tokenReciver(token : String){
        print(token)
        let headers: HTTPHeaders = [
            "Authorization": token
        ]
        self.tokenn = headers
    }
    
    //    .store(in: &cancellables)


    func getUserProfile(_ token : HTTPHeaders ){
        AF.request(urlGetUserFullProfile, method: .get, headers: tokenn)
    }
}


