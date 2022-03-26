//
//  LoginModelView.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation
import Combine

class LoginViewModel {
    
    //publisher -----      -----suscriptores
//    publisher por default = PassthroughSubject
    var emailFlag : Bool = false
    var passwordFlag : Bool = false
    var responseFlag : Bool = false
    
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    
    public var validationState = PassthroughSubject<String,Never>()//declarando publisher
    
    
    public func getAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("response")
        }else {
            self.emailFlag = true
        }
        
        
    }
    
    public func emailAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("email")
        }else {
            self.passwordFlag = true
        }
        
    }
    
    public func passwordAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("password")
        }else {
            self.responseFlag = true
            goToNextPage()
        }
        
    }
    func goToNextPage(){
        if self.emailFlag == true && self.passwordFlag == true && self.responseFlag == true {
//            let HomeView = HomeViewController()
//            HomeView.modalPresentationStyle = .fullScreen
//            present(HomeView,animated: true,completion:{print("register button press validated")} )
        }
    }
    
    init() {
        self.newAlertText = ""
    }
    
     private func newAlert(_ type : String){
        if type == "email"{
            print("new alert dispatched")
            let textEmailAlert: String = "Ingrese Un Correo Electronico"
            newAlertText = textEmailAlert
        }else if type == "password"{
            print("new alert dispatched")
            let textPasswordAlert: String = "Ingrese Un Password"
            newAlertText = textPasswordAlert
        }else if type == "response"{
            print("new alert dispatched")
            let textEmailAlert: String = "Credenciales Invalidas Intente de Nuevo"
            newAlertText = textEmailAlert
        }else {
            print("new alert dispatched")
            let access: String = "access"
            newAlertText = access
        }
        
    }
}
