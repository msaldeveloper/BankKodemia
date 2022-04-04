//
//  CreateNewAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import Combine

class CreateNewAccountViewModel {
 
    private var mailData : String = ""  //CreateAccount
    private var nameData : String = ""  //DetailAccount
    private var lastNameData : String = ""  //DetailAccount
    private var occupationData : String = ""  //DetailAccount
    private var dateData : String = ""  //DetailAccount
    private var phoneData : String = ""  //PhoneAccount
    private var passwordData : String = ""  //PasswordAccount
    
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
    
    // CreateAccount
    func EmailRegExpValidator(_ email: String){
        if (email.range(of: RegExp.Email, options: .regularExpression, range: nil, locale: nil) != nil) {
            print("Se ha ingresado un correo valido")
        }else{
            print("regexEmail")
            newAlertEmail("regexEmail")
        }
    }
 
    func EmailAccountValidator(_ email: String){
        if email == ""{
            newAlertEmail("email")
        } else {
            mailData = email
        }
    }
    private func newAlertEmail(_ type: String){
        if type == "email"{
            let textEmailAlert: String =  TextAlerts.EmailEmpty
            //let textEmailAlert: String = "Ingrese un correo electrónico"
            newAlertText = textEmailAlert
        } else if type == "regexEmail" {
            let textRegex: String =  TextAlerts.InvalidEmail
            //let textRegex: String =  "Ingresa un correo valido"
            newAlertText = textRegex
            
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
            let textAllAlert: String = TextAlerts.AllTextFieldsEmpty
            //let textAllAlert: String = "Llena correctamente todos los campos requeridos"
            newAlertText = textAllAlert
        }else if type == "firstName"{
            let textFirstNameAlert: String = TextAlerts.TextFirstNameEmpty
            //let textFirstNameAlert: String = "Ingrese su nombre"
            newAlertText = textFirstNameAlert
        }else if type == "lastName"{
            let textLastNameAlert: String = TextAlerts.TextLastNameEmpty
            //let textLastNameAlert: String = "Ingrese su apellido"
            newAlertText = textLastNameAlert
        }else if type == "occupation"{
            let textOccupationAlert: String = TextAlerts.TextOccupationEmpty
            //let textOccupationAlert: String = "Ingrese su ocupación"
            newAlertText = textOccupationAlert
        }else if type == "date"{
            let textDateAlert: String = TextAlerts.TextDateEmpty
            //let textDateAlert: String = "Ingrese su fecha de nacimiento"
            newAlertText = textDateAlert
        }
    }
    
    //Registro  de  Celular
    func PhoneRegExpValidator(_ phone: String){
        if (phone.range(of: RegExp.Phone, options: .regularExpression, range: nil, locale: nil) != nil) {
            print(TextAlerts.SuccesValidation)
        }else{
            newAlertPhone("regexPhone")
        }
    }
    
    func phoneAccountValidator(_ phone: String){
        if phone == ""{
            newAlertPhone("phone")
        } else {
            phoneData = phone
        }
    }
    private func newAlertPhone(_ type: String){
        if type == "phone"{
            let textPhoneAlert: String = TextAlerts.TextPhoneEmpty
            //let textPhoneAlert: String = "Ingrese su teléfono"
            newAlertText = textPhoneAlert
        } else if type == "regexPhone"{
            let textRegexPhone: String = TextAlerts.InvalidPhone
            //let textRegexPhone: String = "Tu número celular debe contener 10 dígitos"
            newAlertText = textRegexPhone
            
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
            
            //let textIdAlert: String = TextAlerts.TextPhoneEmpty
            let textIdAlert: String = "Envíe una foto de una identificacion"
            newAlertText = textIdAlert
        }else if type == "success" {
            let success: String = "success"
            newAlertText = success
        }
    }
    
    
    
    //Registro  de  Contraseña
    func PasswordRegExpValidator(_ createNewPassword: String, _ confirmNewPassword: String){
        if createNewPassword == confirmNewPassword {
            if (createNewPassword.range(of: RegExp.Password, options: .regularExpression, range: nil, locale: nil) != nil) {
                print(TextAlerts.SuccesValidation)
            }else {
                print("OH NOOOOOO")
                newAlertPassword("regexPassword")
            }
        }else {
            print("NO son iguales")
            newAlertPassword("regexUnequalPassword")
        }
        
    }
    
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
            let textAllPasswordAlert: String = TextAlerts.AllPasswordFieldsEmpty
            //let textAllPasswordAlert: String = "Llena correctamente todos los campos requeridos"
            newAlertText = textAllPasswordAlert
        }else if type == "createNewPassword"{
            let textPasswordAlert: String = TextAlerts.TextPasswordEmpty
            //let textPasswordAlert: String = "Ingrese una contraseña"
            newAlertText = textPasswordAlert
        }else if type == "confirmNewPassword"{
            let textConfirmPasswordAlert: String = TextAlerts.TextConfirmPasswordEmpty
            //let textConfirmPasswordAlert: String = "La contraseña no coincide"
            newAlertText = textConfirmPasswordAlert
        }else if type == "regexPassword"{
            let textRegexPassword: String = "La contraseña debe de tener una mayuscula, un numero y un signo"
            newAlertText = textRegexPassword
        }else if type == "regexUnequalPassword"{
            let textUnequalPassword: String = "Las contraseñas NO coinciden"
            newAlertText = textUnequalPassword
        }
    }
}
