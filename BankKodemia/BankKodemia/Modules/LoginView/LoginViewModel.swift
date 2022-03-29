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
    private var chocolateCookie : String = String()
    private var lemonCookie : String = String()
    //var loginViewController = LoginViewController()
    
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    
    public var validationState = PassthroughSubject<String,Never>()//declarando publisher
    
    
    public func getAlert(){//funcion que se va a llamar desde nuestro ViewController
        print("get alert dispatched")
        flagValidator()
    }
    public func emailAlert(_ value : String){//funcion que se va a llamar desde nuestro ViewController
        if value == "" {
            print("get alert dispatched")
            newAlert("email")
        }else {
            userLogin()
            self.chocolateCookie = value
            self.emailFlag = true
            print(value)
            flagValidator()
        }
    }
    public func passwordAlert(_ value : String){//funcion que se va a llamar desde nuestro ViewController
        if value == "" {
            print("get alert dispatched")
            newAlert("password")
        }else {
            userLogin()
            self.lemonCookie = value
            self.passwordFlag = true
            print(value)
            flagValidator()        }
    }
    func tokenReciver(accessToken: String){
        print("access token --> ",accessToken)
        if accessToken != "" {
            newAlert("access")
//            self.responseFlag = true
//            goToNextPage()
        }
    }
    func goToNextPage(){
        if self.emailFlag == true && self.passwordFlag == true && self.responseFlag == true {
            newAlert("access")
        }
    }
    private func flagValidator(){
        if self.chocolateCookie != "" && self.lemonCookie != "" {
            userLogin()
        }
    }
    private func userLogin(){
        loginApp(self.chocolateCookie, self.lemonCookie)
        print("@@@@@@@@",self.chocolateCookie, self.lemonCookie)
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
        }else if type == "access" {
            print("access dispatched")
            let access: String = "access"
            newAlertText = access
        }
        
    }
}
