//
//  DepositViewModel.swift
//  BankKodemia
//
//  Created by Mariela Torres on 04/04/22.
//

import Foundation
import Combine

class DepositViewModel {

//    var homeViewModel = HomeViewModel()
//    var addRecipientViewModel = AddRecipientViewModel()
    private var cancellables: [AnyCancellable] = []
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    public var validationState = PassthroughSubject<String,Never>()
    
    init() {
        self.newAlertText = ""
    }
    
    func depositValidator(_ chocolate: String, _ lemon: String){
        if chocolate == "" {
            newAlert("amount")
        }else if lemon == ""{
            newAlert("concept")
        }else {
            makeDeposit(chocolate, lemon)
        }
    }
    
    private func makeDeposit(_ chocolateCookie:String,_ lemonCookie: String ){
//        loginApp(chocolateCookie, lemonCookie).sink{ result in
//            let token = result.value?.token ?? ""
//            self.tokenDispatcher(token)
//            switch result.result {
//            case .success(_):
//                self.newAlert("access")
//                Auth.auth().signIn(withEmail: chocolateCookie, password: lemonCookie, completion: nil)
//            case .failure(_):
//                self.newAlert("forbiden")
//            }
//        }.store(in: &cancellables)
        print("haciendo deposito")
    }
    
//    func tokenDispatcher(_ token: String){
//        self.homeViewModel.tokenReciver(token: token)
//        self.addRecipientViewModel.tokenReciver(token: token)
//    }

     private func newAlert(_ type : String){
        if type == "amount"{
            let textEmailAlert: String = "Ingrese una cantidad mayor a 0"
            newAlertText = textEmailAlert
        }else if type == "concept"{
            let textPasswordAlert: String = "Ingrese un concepto"
            newAlertText = textPasswordAlert
        }
    }
}

