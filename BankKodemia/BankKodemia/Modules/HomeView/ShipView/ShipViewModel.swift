//
//  DepositViewModel.swift
//  BankKodemia
//
//  Created by Mariela Torres on 04/04/22.
//

import Foundation
import Combine
import Alamofire

class ShipViewModel {

//    var homeViewModel = HomeViewModel()
//    var addRecipientViewModel = AddRecipientViewModel()
    private var cancellables: [AnyCancellable] = []
    static var newToken = HTTPHeaders()
    static var userId = "62170b9927cf12a652414ded"
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    public var validationState = PassthroughSubject<String,Never>()
    
    init() {
        self.newAlertText = ""
    }
    
    func shipDepositValidator(_ deposit: String, _ concept: String){
        if concept == "" {
            newAlert("concept")
        }else {
            let parseDeposit = Int(deposit) ?? 0
            makeDeposit(parseDeposit, concept)
            if parseDeposit <= 0 {
                newAlert("amount")
            }
        }
    }
    
    func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        print("token in token reciver",token)
        ShipViewModel.newToken = headers
        
        
    }
    
    private func makeDeposit(_ deposit:Int,_ concept: String ){
        print("data before post",deposit,concept)
        shipAction(deposit, concept, "PAYMENT", ShipViewModel.newToken, ShipViewModel.userId)
            .sink{ result in
            switch result.result {
            case .success(_):
                print("success")
                self.newAlert("success")
            case .failure(_):
                print("fail")
            }
        }.store(in: &cancellables)
        print("haciendo deposito")
    }
     private func newAlert(_ type : String){
        if type == "amount"{
            let textEmailAlert: String = "Ingrese una cantidad mayor a 0"
            newAlertText = textEmailAlert
        }else if type == "concept"{
            let textPasswordAlert: String = "Ingrese un concepto"
            newAlertText = textPasswordAlert
        }
        else if type == "success"{
             let textPasswordAlert: String = "success"
             newAlertText = textPasswordAlert
         }
    }
}

