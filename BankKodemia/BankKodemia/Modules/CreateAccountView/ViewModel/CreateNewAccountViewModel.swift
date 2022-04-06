//
//  CreateNewAccountViewModel.swift
//  BankKodemia
//
//  Created by MacBook on 02/04/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Combine

class CreateNewAccountViewModel {
    
    private static var emailData : String = ""  //CreateAccount
    private static var nameData : String = ""  //DetailAccount
    private static var lastNameData : String = ""  //DetailAccount
    private static var occupationData : String = ""  //DetailAccount
    private static var dateData : String = ""  //DetailAccount
    private static var phoneData : String = ""  //PhoneAccount
    private static var identityImage : String = ""  //IMAGEN
    private static var identityImageType : String = ""  //TIPO DE INE
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
            let lada = "+52"
            let newPhone = lada+phone
            CreateNewAccountViewModel.phoneData = newPhone
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
    func idSelectValidator(_ idSelect: String){
        if idSelect == ""{
            newAlertIdSelect("idSelect")
        } else {
           CreateNewAccountViewModel.identityImageType = idSelect
        }
    }

    private func newAlertIdSelect(_ type: String){
        if type == "idSelect"{
            //let textIdSelect: String = TextAlerts.TextIdSelectEmpty
            let textIdSelectAlert: String = "Selecciona un Documento como identificación oficial"
            newAlertText = textIdSelectAlert
        }
    }
    
    // MARK: Upload
    func uploadValidator(_ idUpload: String){
        if idUpload == ""{
            newAlertIdSelect("idUpload")
        } else {
           CreateNewAccountViewModel.identityImage = idUpload
        }
    }

    private func newAlertUpload(_ type: String){
        if type == "idUpload"{
            //let textIdSelect: String = TextAlerts.TextIdSelectEmpty
            let textIdUploadAlert: String = "Envía una fotografía de tu identificación"
            newAlertText = textIdUploadAlert
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
 
    func userCreate(){
        createApp(CreateNewAccountViewModel.emailData, CreateNewAccountViewModel.nameData, CreateNewAccountViewModel.lastNameData, CreateNewAccountViewModel.dateData,
            CreateNewAccountViewModel.passwordData,
            CreateNewAccountViewModel.phoneData,
            CreateNewAccountViewModel.identityImage,
            CreateNewAccountViewModel.identityImageType,
            CreateNewAccountViewModel.occupationData
        )
            .sink{ result in
                print("Codigo de Validacion", result.result)
            switch result.result {
            case .success(_):
                Auth.auth().createUser(withEmail: CreateNewAccountViewModel.emailData, password: CreateNewAccountViewModel.passwordData, completion: nil)
                self.newAlert("access")
            case .failure(_):
                self.newAlert("forbiden")
            }
        }
            .store(in: &cancellables)
    }
    private func newAlert(_ type : String){
        if type == "access" {
           let access: String = "access"
           newAlertText = access
       }else if type == "forbiden" {
           let access: String = "Datos incorrectos X"
           newAlertText = access
       }
   }
}
