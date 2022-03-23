//
//  CreateAccountViewController.swift
//  BankKodemia
//
//  Created by MacBook on 19/03/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestEmail: Indicaciones de la seccion
    var emailSuggest: UIView = UIView()
    var arrowButton: UIButton = UIButton()
    var titleSuggestLabel: UILabel = UILabel()
    var infoSuggestLabel: UILabel = UILabel()
    
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

    
    var backgroundColor = ConstantsUIColor.clearBackground
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
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
        emailFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        emailAccountTextField = UITextField()
        emailAccountTextField.formatTextField(Text.CreateAccount.EmailRegister.InputMessage)
        emailAccountTextField.font = UIFont(name: "Poppins-Medium", size: 18)
        emailAccountTextField.keyboardType = .emailAddress
        emailFieldView.addSubview(emailAccountTextField)
        emailAccountTextField.addAnchorsAndSize(width: nil, height: nil, left: 0, top: 0, right: 0, bottom: 0)
        
        
        
        emailTextLabel = UILabel()
        emailTextLabel.text = Text.CreateAccount.EmailRegister.LabelMessage
        emailTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        emailFieldView.addSubview(emailTextLabel)
        emailTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: emailAccountTextField)
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
        
        let detailAccountViewController = DetailAccountViewController()
        detailAccountViewController.modalPresentationStyle = .fullScreen
        present(detailAccountViewController, animated: true, completion: nil)
        
    }
}


