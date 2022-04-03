//
//  CreateNewAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import Combine

class CreateNewAccountViewModel {
    //CreateAccount
    private var mailData : String = ""
    //DetailAccount
    private var nameData : String = ""
    private var lastNameData : String = ""
    private var occupationData : String = ""
    private var dateData : String = ""
    //PhoneAccount
    private var phoneData : String = ""
    //PasswordAccount
    private var passwordData : String = ""
    
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
    
    //Registro de Email - CreateAccount
    func emailAccountValidator(_ email: String){
        if email == ""{
            newAlertEmail("email")
        } else {
            mailData = email
        }
    }
    private func newAlertEmail(_ type: String){
        if type == "email"{
            let textEmailAlert: String = "Ingrese un correo electrónico"
            newAlertText = textEmailAlert
        }
    }
        
    
    //Registro  de  Nombre, Apellido, Ocupacion y Fecha  de Nacimiento - DetailAccount
    func createAccountValidator(_ firstName: String, _ lastName: String, _ occupation: String, _ date: String){
        if  (firstName == "") && (lastName == "") && (occupation == "") && (date == ""){
            newAlertCreateAccount("all")
        } else if firstName == ""{
            newAlertCreateAccount("firstName")
        }else if lastName == ""{
            newAlertCreateAccount("lastName")
        }else if occupation == ""{
            newAlertCreateAccount("occupation")
        }else if date == "" {
            newAlertCreateAccount("date")
        }else {
         
            nameData = firstName
            lastNameData = lastName
            occupationData = occupation
            dateData = date
            
        }
        
    }
    private func newAlertCreateAccount(_ type: String){
        if type == "all"{
            let textAllAlert: String = "Llena correctamente todos los campos requeridos"
            newAlertText = textAllAlert
        }else if type == "firstName"{
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
        }
    }
    
    
    //Registro  de  Celular
    func phoneAccountValidator(_ phone: String){
        if phone == ""{
            newAlertPhone("phone")
        } else {
            phoneData = phone
        }
    }
    private func newAlertPhone(_ type: String){
        if type == "phone"{
            let textPhoneAlert: String = "Ingrese su teléfono"
            newAlertText = textPhoneAlert
        }
    }
    
    
    
    
    //Registro  de  ID
    func idAccountValidator(_ id: String){
        if id == ""{
            newAlertId("id")
        } else {
//            idUser(id)
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
    
    
    
    //Registro  de  Contraseña
    func passwordAccountValidator(_ createNewPassword: String, _ confirmNewPassword: String){
        if (createNewPassword == "") && (confirmNewPassword == ""){
            newAlertPassword("all")
        }else if createNewPassword == ""{
            newAlertPassword("createNewPassword")
        }else if confirmNewPassword == ""{
            newAlertPassword("confirmNewPassword")
        } else {
            passwordData = createNewPassword
        }
    }
    private func newAlertPassword(_ type: String){
        if type == "all"{
            let textAllAlert: String = "Llena correctamente todos los campos requeridos"
            newAlertText = textAllAlert
        }else if type == "createNewPassword"{
            let textPasswordAlert: String = "Ingrese una contraseña"
            newAlertText = textPasswordAlert
        }else if type == "confirmNewPassword"{
            let textConfirmPasswordAlert: String = "La contraseña no coincide"
            newAlertText = textConfirmPasswordAlert
        }
    }
    

    


    

    
}
