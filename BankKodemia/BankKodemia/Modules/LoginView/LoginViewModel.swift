//
//  LoginModelView.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
//

import Foundation
import Combine

struct LoginViewModel {
    
    //publisher -----      -----suscriptores
//    publisher por default = PassthroughSubject
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
    
    public var validationState = PassthroughSubject<String,Never>()//declarando publisher
    
    
    public mutating func getAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("credential")
        }
        
    }
    
    public mutating func emailAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("email")
        }
        
    }
    
    public mutating func passwordAlert(_ Value : String){//funcion que se va a llamar desde nuestro ViewController
        if Value == "" {
            print("get alert dispatched")
            newAlert("password")
        }
        
    }
    
    init() {
        self.newAlertText = ""
    }
    
    mutating private func newAlert(_ type : String){
        if type == "email"{
            print("new alert dispatched")
            let textEmailAlert: String = "Ingrese Un Correo Electronico"
            newAlertText = textEmailAlert
        }else if type == "password"{
            print("new alert dispatched")
            let textEmailAlert: String = "Ingrese Un Password"
            newAlertText = textEmailAlert
        }else {
            print("new alert dispatched")
            let textEmailAlert: String = "Credenciales Invalidas Intente de Nuevo"
            newAlertText = textEmailAlert
        }
        
    }
}
