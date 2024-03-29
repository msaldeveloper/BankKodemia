//
//  PhoneAccountController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit
import Combine

class PhoneAccountViewController: UIViewController, UITextViewDelegate {
    lazy var logo : UIImageView = UIImageView()
    var arrowButton: UIButton = UIButton()
    var titleSuggestLabel: UILabel = UILabel()
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    
    // PhoneInfoFields: Indicaciones de la seccion
    var phoneInfoFieldView: UIView = UIView()
    var phoneInfoTextLabel: UILabel = UILabel()
    var phoneInfoTextField: UITextField = UITextField()
    
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    
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
        returnButton()
        titleLabel()
        suggestDetailInfoSection()
        phoneInfoFieldSection()
        legalInformationSection()
        continueButtonSection()
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func returnButton(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: Text.CreateAccount.Detail.title.uppercased(), widthText: width/2)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func titleLabel(){
        view.addSubview(titleSuggestLabel)
        titleSuggestLabel.formartTitle(view: view, textTitle: Text.CreateAccount.PhoneVerification.title)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.textColor = .black
        infoSuggestLabel.text = Text.CreateAccount.PhoneVerification.ButtonBoldMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func phoneInfoFieldSection(){
        
        phoneInfoFieldView = UIView()
        phoneInfoFieldView.formatUIView(activate: false)
        view.addSubview(phoneInfoFieldView)
        phoneInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        phoneInfoFieldView.addSubview(phoneInfoTextField)
        phoneInfoTextField.infoTextFielFormat()
        phoneInfoTextField.keyboardType = .numberPad
    
        phoneInfoTextLabel = UILabel()
        phoneInfoTextLabel.textColor = .black
        phoneInfoTextLabel.text = Text.CreateAccount.PhoneVerification.LabelNumberMessage
        phoneInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        phoneInfoTextField.addSubview(phoneInfoTextLabel)
        phoneInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: phoneInfoFieldView)
        
        
    }
    
    func legalInformationSection(){
        
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
                        
        legalTextLabel = UILabel()
        legalTextLabel.textColor = .black
        legalTextLabel.text = Text.CreateAccount.PhoneVerification.BottonMessage
        legalTextLabel.numberOfLines = 0
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .center
        legalButton.addSubview(legalTextLabel)
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
    
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        return self.textLimit(existingText: textView.text,
                              newText: text,
                              limit: 10)
    }
    
    private func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
    
    
    
    

}

// MARK: - OBJC Functions
extension PhoneAccountViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        self.createNewAccountViewModel.phoneAccountValidator(phoneInfoTextField.text ?? "")
        self.createNewAccountViewModel.PhoneRegExpValidator(phoneInfoTextField.text ?? "")

        let identityVerificarionViewController = IdentityVerificationViewController()
        identityVerificarionViewController.modalPresentationStyle = .fullScreen
        present(identityVerificarionViewController, animated: true, completion: nil)
    
    }
}
