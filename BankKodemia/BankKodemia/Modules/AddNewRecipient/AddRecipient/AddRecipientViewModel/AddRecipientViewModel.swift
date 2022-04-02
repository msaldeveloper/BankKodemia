//
//  AddRecipientViewModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 01/04/22.
//

import Foundation
import Combine
import Alamofire
import AVFoundation

var listUserRequest = ListUserRequest()

struct AddRecipientViewModel {
    var cancellables: [AnyCancellable] = []

    var getUserData = GetUserRequest()
    static var newToken = HTTPHeaders()
    
    
    fileprivate var requestValidator: HTTPHeaders {
        didSet{
            listUserDataRequestPublisher.send(requestValidator)
        }
    }
    var listUserDataRequestPublisher = PassthroughSubject<HTTPHeaders,Never>()
    
    init() {
        self.requestValidator = HTTPHeaders()
    }
    
    mutating func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        print("token in token reciver",token)
        requestValidator = headers
        AddRecipientViewModel.newToken = headers
        
        
    }
    
    
    mutating func listUserDataRequest(){
        listUserRequest.getUserData(AddRecipientViewModel.newToken)
            .sink{ fullData in
                print("name", fullData.value?.data.users[1].name ?? "")
            }.store(in: &cancellables)

    }
}
