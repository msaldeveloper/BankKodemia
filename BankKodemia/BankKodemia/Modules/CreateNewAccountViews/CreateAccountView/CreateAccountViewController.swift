//
//  CreateAccountViewController.swift
//  BankKodemia
//
//  Created by MacBook on 19/03/22.
//

import UIKit
import Combine

class CreateAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestEmail: Indicaciones de la seccion
    var emailSuggest: UIView = UIView()
    var arrowButton: UIButton = UIButton()
    var titleSuggestLabel: UILabel = UILabel()
    var infoSuggestLabel: UILabel = UILabel()
    
    //
    var fieldEmail : UIView = UIView()
    var textFieldEmail : UITextField = UITextField()
    var textFieldLabelTop : UILabel = UILabel()
    
    // EmailField: Indicaciones de la seccion
    var emailFieldView: UIView = UIView()
    var emailTextLabel: UILabel = UILabel()
    var emailAccountTextField: UITextField = UITextField()
    
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    var legalTextLinkedLabel: UILabel = UILabel()
    
    // Boton para continuar
    var incomingFieldView: UIView = UIView()
    var incomingTextLabel: UILabel = UILabel()
    var incomingButton: UIButton = UIButton()
    
    var alerta = ""
    private var createNewAccountViewModel = CreateNewAccountViewModel()
    private var cancellables: [AnyCancellable] = []

    
    var backgroundColor = ConstantsUIColor.clearBackground
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()
        validationBind()
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    func UIInit(){
        logoImage()
        suggestEmailSection()
        createEmailSection()
        legalInformationSection()
        continueButtonSection()
        
    }
    
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestEmailSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.EmailRegister.DescriptionMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
    }
    
    func createEmailSection(){
        
        emailFieldView = UIView()
        emailFieldView.formatUIView(activate: false)
        view.addSubview(emailFieldView)
        emailFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 46, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        emailAccountTextField = UITextField()
        emailAccountTextField.formatTextField(Text.CreateAccount.EmailRegister.InputMessage)
        emailAccountTextField.font = UIFont(name: "Poppins-Medium", size: 14)
        emailAccountTextField.keyboardType = .emailAddress
        emailFieldView.addSubview(emailAccountTextField)
        emailAccountTextField.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        emailTextLabel = UILabel()
        emailTextLabel.text = Text.CreateAccount.EmailRegister.LabelMessage
        emailTextLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        view.addSubview(emailTextLabel)
        emailTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: emailFieldView)
    
    }
    
    func legalInformationSection(){
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
                
        legalTextLinkedLabel = UILabel()
        legalTextLinkedLabel.formatPurpleLink()
        legalTextLinkedLabel.text = Text.CreateAccount.EmailRegister.PrivacyBoldMessage
        legalTextLinkedLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLinkedLabel.textAlignment = .center
        legalButton.addSubview(legalTextLinkedLabel)
        legalTextLinkedLabel.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 10, right: 10, bottom: 10)
        
        legalTextLabel = UILabel()
        legalTextLabel.text = Text.CreateAccount.EmailRegister.PrivacyMessage
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .center
        legalTextLinkedLabel.addSubview(legalTextLabel)
        legalTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 20)

        
    }
    
    func continueButtonSection(){
        
        incomingButton.formartBlueGreen()
        incomingButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: TextLocals.continue_button_message)
        
    }
    
    //suscriptor
    fileprivate func validationBind(){
        self.createNewAccountViewModel
            .validationState
            .sink{ newAlertText in
               print("esperando acceso ->",newAlertText)
                if newAlertText == "access"{
                    
                    
                }else {
                    print("new alert -->>",newAlertText)
                    self.updateAlert(newAlertText)
                }
            }
            .store(in: &cancellables)
    }
    
    func updateAlert(_ alertText: String){
        alerta = alertText
        print(alertText)
        let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(aceptar)
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: - OBJC Functions
extension CreateAccountViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        self.createNewAccountViewModel.emailAccountValidator(self.emailAccountTextField.text ?? "")
        
        let mail = emailAccountTextField.text
        let regexMail = "^([a-z]|[A-Z])+(\\w|\\W)+@(([a-z]|[A-Z])+\\.([a-z]|[A-Z])+|([a-z]|[A-Z])+\\.([a-z]|[A-Z])+\\.([a-z]|[A-Z])+)$"

        if (mail?.range(of: regexMail, options: .regularExpression, range: nil, locale: nil) != nil){
            print("Bien hecho")
            let detailAccountViewController = DetailAccountViewController()
            detailAccountViewController.modalPresentationStyle = .fullScreen
            present(detailAccountViewController, animated: true, completion: nil)
        } else {
            self.updateAlert("Ingresa un correo valido")
        }
        
    }
}


