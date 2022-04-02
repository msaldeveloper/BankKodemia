//
//  CreateAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import Combine

class CreateAccountViewModel {
    //var homeViewModel = HomeViewModel()
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
    
    func emailValidator(_ email: String){
//        if email == ""{
//            newAlert("email")
//        }else {
//            emailLogin(email)
//        }
    }
    
    private func emailLogin(_ email:String ){
 
    }
    
    
    
    
}
