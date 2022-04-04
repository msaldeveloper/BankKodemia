//
//  CreatePaswordViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit
import Combine

class CreatePasswordViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    var legalTopLabel: UILabel = UILabel()
    var legalBottomLabel: UILabel = UILabel()
    
    // FieldsViews
    var createPasswordFieldView: UIView = UIView()
    var confirmPasswordFieldView: UIView = UIView()
    
    //Labels
    var createPasswordTextLabel: UILabel = UILabel()
    var confirmPasswordTextLabel: UILabel = UILabel()
    
    //TextFiels
    var createPasswordTextField: UITextField = UITextField()
    var confirmPasswordTextField: UITextField = UITextField()
    
    // Boton para continuar
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
    
    func UIInit(){
        logoImage()
        suggestInfoSection()
        createPasswordField()
        confirmPasswordField()
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestInfoSection(){
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.CreatePassword.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
        legalTopLabel = UILabel()
        legalTopLabel.text = Text.CreateAccount.CreatePassword.MediumMessage
        legalTopLabel.font = UIFont(name: "Poppins", size: 16)
        legalTopLabel.textAlignment = .left
        legalTopLabel.lineBreakMode = .byWordWrapping
        legalTopLabel.numberOfLines = 0
        view.addSubview(legalTopLabel)
        legalTopLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/40, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        legalBottomLabel = UILabel()
        legalBottomLabel.text = Text.CreateAccount.CreatePassword.BottomMessage
        legalBottomLabel.font = UIFont(name: "Poppins", size: 16)
        legalBottomLabel.textAlignment = .left
        legalBottomLabel.lineBreakMode = .byWordWrapping
        legalBottomLabel.numberOfLines = 0
        view.addSubview(legalBottomLabel)
        legalBottomLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/40, right: 21, bottom: nil, withAnchor: .top, relativeToView: legalTopLabel)
        

    }
    
    func createPasswordField(){
        createPasswordFieldView = UIView()
        createPasswordFieldView.formatUIView(activate: false)
        view.addSubview(createPasswordFieldView)
        createPasswordFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: legalBottomLabel)
        
        createPasswordFieldView.addSubview(createPasswordTextField)
        createPasswordTextField.infoTextFielFormat()
        
        createPasswordTextLabel = UILabel()
        createPasswordTextLabel.text = Text.CreateAccount.CreatePassword.CreateLabel
        createPasswordTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        createPasswordFieldView.addSubview(createPasswordTextLabel)
        createPasswordTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: createPasswordFieldView)
    }
    
    func confirmPasswordField(){
        confirmPasswordFieldView = UIView()
        confirmPasswordFieldView.formatUIView(activate: false)
        view.addSubview(confirmPasswordFieldView)
        confirmPasswordFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: createPasswordFieldView)
        
        confirmPasswordFieldView.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.infoTextFielFormat()
        
        confirmPasswordTextLabel = UILabel()
        confirmPasswordTextLabel.text = Text.CreateAccount.CreatePassword.ConfirmLabel
        confirmPasswordTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        confirmPasswordFieldView.addSubview(confirmPasswordTextLabel)
        confirmPasswordTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: confirmPasswordFieldView)
        
    }
    
    func continueButtonSection(){
        incomingButton.formartBlueGreen()
        incomingButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: Text.CreateAccount.CreatePassword.ButtonCreateMessage)
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
extension CreatePasswordViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        self.createNewAccountViewModel.passwordAccountValidator(
            createPasswordTextField.text ?? "",
            confirmPasswordTextField.text ?? "" )
        
        self.createNewAccountViewModel.PasswordRegExpValidator(
            createPasswordTextField.text ?? "",
            confirmPasswordTextField.text ?? "" )
        
        let successViewController = SuccessViewController()
        successViewController.modalPresentationStyle = .fullScreen
        present(successViewController, animated: true, completion: nil)
    
    }
}

