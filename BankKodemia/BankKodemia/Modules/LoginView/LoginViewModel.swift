//
//  LoginModelView.swift
//  BankKodemia
//
//  Created by Mario Saldana on 26/03/22.
import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase
protocol TokenProtocol {
    func updateToken(token: LoggedInModel)
}

class LoginViewModel {
    //publisher -----      -----suscriptores
//    publisher por default = PassthroughSubject
    var emailFlag : Bool = false
    var passwordFlag : Bool = false
    var responseFlag : Bool = false
    private var chocolateCookie : String = String()
    var getUserRequest = GetUserRequest()
    private var lemonCookie : String = String()
    private var cancellables: [AnyCancellable] = []
    //var loginViewController = LoginViewController()
    
    fileprivate var newAlertText: String {
        didSet{
            validationState.send(newAlertText)
        }
    }
//    fileprivate var token : String {
//        didSet{
//            tokenSender.send(token)
//        }
//    }
    public var validationState = PassthroughSubject<String,Never>()//declarando publisher
    //public var tokenSender = PassthroughSubject<String,Never>()//declarando publisher
    
    init() {
        self.newAlertText = ""
        //self.token = ""
    }
    
    public func getAlert(){//funcion que se va a llamar desde nuestro ViewController
        print("get alert dispatched")
        flagValidator()
    }
    public func emailAlert(_ value : String){//funcion que se va a llamar desde nuestro ViewController
        if value == "" {
            print("get alert dispatched")
            newAlert("email")
        }else {
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
            self.lemonCookie = value
            self.passwordFlag = true
            print(value)
            flagValidator()        }
    }
    private func flagValidator(){
        if self.chocolateCookie != "" && self.lemonCookie != "" {
            userLogin()
            
        }
    }
    
    private func userLogin(){
        loginApp(self.chocolateCookie, self.lemonCookie).sink{ result in
            self.getUserRequest.tokenReciver(token: result.value?.token ?? "")
            switch result.result {
            case .success(_):
                self.newAlert("access")
                Auth.auth().signIn(withEmail: self.chocolateCookie, password: self.lemonCookie, completion: nil)
                //self.token = result.value?.token ?? ""
                //LoggedInModel(token: result.value?.token ?? "")
            case .failure(_):
                self.newAlert("forbiden")
            }
            print("@@@@@@@@>>",result.value?.token ?? "")
            print(result.response?.statusCode ?? "" )
            
        }.store(in: &cancellables)
    }

     private func newAlert(_ type : String){
        if type == "email"{
            print("new alert dispatched")
            let textEmailAlert: String = "Ingrese Un Correo Electronico"
            newAlertText = textEmailAlert
        }else if type == "password"{
            print("new alert dispatched")
            let textPasswordAlert: String = "Ingrese Una Contraseña"
            newAlertText = textPasswordAlert
        }else if type == "access" {
            print("access dispatched")
            let access: String = "access"
            newAlertText = access
        }else if type == "forbiden" {
            print("access dispatched")
            let access: String = "Correo o contraseña incorrectos"
            newAlertText = access
        }
    }
}
