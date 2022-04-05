//
//  DepositViewModel.swift
//  BankKodemia
//
//  Created by Mariela Torres on 04/04/22.
//

import Foundation
import Combine
import Alamofire

class DepositViewModel {

//    var homeViewModel = HomeViewModel()
//    var addRecipientViewModel = AddRecipientViewModel()
    private var cancellables: [AnyCancellable] = []
    static var newToken = HTTPHeaders()
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    public var validationState = PassthroughSubject<String,Never>()
    
    init() {
        self.newAlertText = ""
    }
    
    func depositValidator(_ deposit: String, _ concept: String){
        if deposit == "" {
            newAlert("amount")
        }else if concept == ""{
            newAlert("concept")
        }else {
            let parseDeposit = Int(deposit) ?? 0
            makeDeposit(parseDeposit, concept)
        }
    }
    
    func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        print("token in token reciver",token)
        DepositViewModel.newToken = headers
        
        
    }
    
    private func makeDeposit(_ deposit:Int,_ concept: String ){
        print("data before post",deposit,concept)
        depositAction(deposit, concept, "DEPOSIT", DepositViewModel.newToken).sink{ result in
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

