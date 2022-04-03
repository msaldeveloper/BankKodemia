//
//  CreateNewAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import Combine

class CreateNewAccountViewModel {
    
    private var mail : String = ""
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
    
    //Registro de Email
    func emailAccountValidator(_ email: String){
        if email == ""{
            newAlertEmail("email")
        } else {
            mail = email
            //emailUser(email)
        }
    }
    
    //Func newAlertEmail
    private func newAlertEmail(_ type: String){
        if type == "email"{
            let textEmailAlert: String = "Ingrese un correo electrónico"
            newAlertText = textEmailAlert
        }
    }
    
//    private func emailUser(_ email: String){
//            
//    }
    
    
    //Registro  de  Nombre, Apellido, Ocupacion y Fecha  de Nacimiento
    func createAccountValidator(_ firstName: String, _ lastName: String, _ occupation: String, _ date: String){
        if firstName == ""{
            newAlertCreateAccount("firstName")
        }else if lastName == ""{
            newAlertCreateAccount("LastName")
        }else if occupation == ""{
            newAlertCreateAccount("occupation")
        }else if date == "" {
            newAlertCreateAccount("date")
        }else {
            createUser(firstName, lastName, occupation, date)
        }
    }
    
    private func createUser(_ firstName: String, _ lastName: String, _ occupation: String, _ date: String){
    }
    
    //Registro  de  Celular
    func phoneAccountValidator(_ phone: String){
        if phone == ""{
            newAlertPhone("phone")
        } else {
            phoneUser(phone)
        }
    }
    
    private func phoneUser(_ phone: String){
    }
    
    //Registro  de  ID
    func idAccountValidator(_ id: String){
        if id == ""{
            newAlertId("id")
        } else {
            idUser(id)
        }
    }
    
    private func idUser(_ id: String){
    }
    
    //Registro  de  Contraseña
    func passwordAccountValidator(_ createNewPassword: String, _ confirmNewPassword: String){
        if createNewPassword == ""{
            newAlertPassword("createNewPassword")
        }else if confirmNewPassword == ""{
            newAlertPassword("confirmNewPassword")
        } else {
            createPasswordUser(createNewPassword, confirmNewPassword)
        }
    }
    
    private func createPasswordUser(_ createNewPassword: String, _ confirmNewPassword: String){
    }
    

    
    //Func newAlertCreateAccount
    private func newAlertCreateAccount(_ type: String){
        if type == "firstName"{
            let textFirstNameAlert: String = "Ingrese su nombre"
            newAlertText = textFirstNameAlert
        }else if type == "lastName"{
            let textLastNameAlert: String = "Ingrese su apellido"
            newAlertText = textLastNameAlert
        }else if type == "occupation"{
            let textOccupationAlert: String = "Ingrese su ocupación"
            newAlertText = textOccupationAlert
        }else if type == "date"{
            let textDateAlert: String = "Ingrese su fecha de nacimiento"
            newAlertText = textDateAlert
        }else if type == "success" {
            let success: String = "success"
            newAlertText = success
        }
    }
    
    //Func newAlertPhone
    private func newAlertPhone(_ type: String){
        if type == "phone"{
            let textPhoneAlert: String = "Ingrese su teléfono"
            newAlertText = textPhoneAlert
        }else if type == "success" {
            let success: String = "success"
            newAlertText = success
        }
    }
    
    //Func newAlertId
    private func newAlertId(_ type: String){
        if type == "id"{
            let textIdAlert: String = "Envíe una foto de una identificacion"
            newAlertText = textIdAlert
        }else if type == "success" {
            let success: String = "success"
            newAlertText = success
        }
    }
    
    //Func newAlertPassword
    private func newAlertPassword(_ type: String){
        if type == "createNewPassword"{
            let textPasswordAlert: String = "Ingrese una contraseña"
            newAlertText = textPasswordAlert
        }else if type == "confirmNewPassword"{
            let textConfirmPasswordAlert: String = "La contraseña no coincide"
            newAlertText = textConfirmPasswordAlert
        }else if type == "success" {
            let success: String = "success"
            newAlertText = success
        }
    }
    
}
