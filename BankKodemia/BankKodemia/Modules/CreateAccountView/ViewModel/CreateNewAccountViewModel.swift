//
//  CreateNewAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import Combine

class CreateNewAccountViewModel {
 
    static var emailData : String = ""  //CreateAccount
    private static var nameData : String = ""  //DetailAccount
    private static var lastNameData : String = ""  //DetailAccount
    private static var occupationData : String = ""  //DetailAccount
    private static var dateData : String = ""  //DetailAccount
    private static var phoneData : String = ""  //PhoneAccount
    private static var passwordData : String = ""  //PasswordAccount
    
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
    
    // MARK: CreateAccount
    func EmailRegExpValidator(_ email: String){
        if (email.range(of: RegExp.Email, options: .regularExpression, range: nil, locale: nil) != nil) {
            print(TextAlerts.SuccesValidation)
        }else{
            print("regexEmail")
            newAlertEmail("regexEmail")
        }
    }
    func EmailAccountValidator(_ email: String){
        if email == ""{
            newAlertEmail("email")
        } else {
            CreateNewAccountViewModel.emailData = email
        }
    }
        private func newAlertEmail(_ type: String){
            if type == "email"{
                let textEmailAlert: String =  TextAlerts.EmailEmpty
                newAlertText = textEmailAlert
            } else if type == "regexEmail" {
                let textRegex: String =  TextAlerts.InvalidEmail
                newAlertText = textRegex
                
            }
        }
        
    // MARK: DetailAccount
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
            CreateNewAccountViewModel.nameData = firstName
            CreateNewAccountViewModel.lastNameData = lastName
            CreateNewAccountViewModel.occupationData = occupation
            CreateNewAccountViewModel.dateData = date
        }
        
    }
    private func newAlertCreateAccount(_ type: String){
        if type == "all"{
            let textAllAlert: String = TextAlerts.AllTextFieldsEmpty
            newAlertText = textAllAlert
        }else if type == "firstName"{
            let textFirstNameAlert: String = TextAlerts.TextFirstNameEmpty
            newAlertText = textFirstNameAlert
        }else if type == "lastName"{
            let textLastNameAlert: String = TextAlerts.TextLastNameEmpty
            newAlertText = textLastNameAlert
        }else if type == "occupation"{
            let textOccupationAlert: String = TextAlerts.TextOccupationEmpty
            newAlertText = textOccupationAlert
        }else if type == "date"{
            let textDateAlert: String = TextAlerts.TextDateEmpty
            newAlertText = textDateAlert
        }
    }
    
    // MARK: PhoneeAccount
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
            CreateNewAccountViewModel.phoneData = phone
        }
    }
        private func newAlertPhone(_ type: String){
            if type == "phone"{
                let textPhoneAlert: String = TextAlerts.TextPhoneEmpty
                newAlertText = textPhoneAlert
            } else if type == "regexPhone"{
                let textRegexPhone: String = TextAlerts.InvalidPhone
                newAlertText = textRegexPhone
                
            }
        }

    // MARK: IdSelect
    func idAccountValidator(_ id: String){
        if id == ""{
            newAlertId("id")
        } else {
//            idUser(id)
        }
    }

    private func newAlertId(_ type: String){
        if type == "id"{
            
            //let textIdAlert: String = TextAlerts.TextPhoneEmpty
            let textIdAlert: String = "Envíe una foto de una identificacion"
            newAlertText = textIdAlert
        }
    }
    
    // MARK: CreatePassword
    func PasswordRegExpValidator(_ createNewPassword: String, _ confirmNewPassword: String){
        if createNewPassword == confirmNewPassword {
            if (createNewPassword.range(of: RegExp.Password, options: .regularExpression, range: nil, locale: nil) != nil) {
                print(TextAlerts.SuccesValidation)
            }else {
                newAlertPassword("regexPassword")
            }
        }else {
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
            CreateNewAccountViewModel.passwordData = createNewPassword
        }
    }
        private func newAlertPassword(_ type: String){
            if type == "all"{
                let textAllPasswordAlert: String = TextAlerts.AllPasswordFieldsEmpty
                newAlertText = textAllPasswordAlert
            }else if type == "createNewPassword"{
                let textPasswordAlert: String = TextAlerts.TextPasswordEmpty
                newAlertText = textPasswordAlert
            }else if type == "confirmNewPassword"{
                let textConfirmPasswordAlert: String = TextAlerts.TextConfirmPasswordEmpty
                newAlertText = textConfirmPasswordAlert
            }else if type == "regexPassword"{
                let textRegexPassword: String = TextAlerts.TextFailPassword
                newAlertText = textRegexPassword
            }else if type == "regexUnequalPassword"{
                let textUnequalPassword: String = TextAlerts.TextWrongPassword
                newAlertText = textUnequalPassword
            }
        }
    
//    private func userCreate(_ chocolateCookie:String,_ lemonCookie: String ){
//        createApp(chocolateCookie, lemonCookie).sink{ result in
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
//    }
}
