//
//  LoginInDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//
import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

class LoginViewModel {

    var homeViewModel = HomeViewModel()
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
    
    func loginValidator(_ chocolate: String, _ lemon: String){
        if chocolate == ""{
            newAlert("email")
        }else if lemon == ""{
            newAlert("password")
        }else {
            userLogin(chocolate, lemon)
        }
    }
    
    private func userLogin(_ chocolateCookie:String,_ lemonCookie: String ){
        loginApp(chocolateCookie, lemonCookie).sink{ result in
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

     private func newAlert(_ type : String){
        if type == "email"{
            let textEmailAlert: String = "Ingrese Un Correo Electronico"
            newAlertText = textEmailAlert
        }else if type == "password"{
            let textPasswordAlert: String = "Ingrese Una Contraseña"
            newAlertText = textPasswordAlert
        }else if type == "access" {
            let access: String = "access"
            newAlertText = access
        }else if type == "forbiden" {
            let access: String = "Correo o contraseña incorrectos"
            newAlertText = access
        }
    }
}
