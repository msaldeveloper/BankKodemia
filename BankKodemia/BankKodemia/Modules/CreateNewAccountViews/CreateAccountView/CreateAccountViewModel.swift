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
        if email == ""{
            newAlert("email")
        }else {
            emailLogin(email)
        }
    }
    
    private func emailLogin(_ email:String ){
        loginApp(email).sink{ result in
            self.homeViewModel.tokenReciver(token: result.value?.token ?? "")
            switch result.result {
            case .success(_):
                self.newAlert("access")
                Auth.auth().signIn(withEmail: chocolateCookie, password: lemonCookie, completion: nil)
            case .failure(_):
                self.newAlert("forbiden")
            }
        }.store(in: &cancellables)
    }
    
    
    
    
}
