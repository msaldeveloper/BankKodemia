//
//  HomeViewModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.
//

import Foundation
import Alamofire
import Combine

class HomeViewModel {
    private var cancellables: [AnyCancellable] = []
    var getUserRequest = GetUserRequest()
    
    func tokenReciver(token : String){
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        getUserRequest
            .getUserProfile(headers).sink{ fullData in
                print("balance",fullData.value?.data.balance ?? 0.0)
            }.store(in: &cancellables)
    }
}
