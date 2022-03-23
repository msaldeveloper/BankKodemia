//
//  LoginViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 17/03/22.
//

import UIKit


class LoginViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var arrowButton: UIButton = UIButton()
    var initSessionLabel: UILabel = UILabel()
    var initSessionWelcomeLabel: UILabel = UILabel()
    var textFieldLabelTop: UILabel = UILabel()
    var fieldEmail : UIView = UIView()
    var textFieldEmail: UITextField = UITextField()
    var passwordFieldLabelTop: UILabel = UILabel()
    var fieldPassword : UIView = UIView()
    var textFieldPassword: UITextField = UITextField()
    var helpMessageLabel: UITextField = UITextField()
    var linkMessageButton: UIButton = UIButton()
    var linkMessageLabel: UILabel = UILabel()
    var initSessionBottomButton: UIButton = UIButton()
    var initSessionButtonLabel: UILabel = UILabel()

    var backgroundColor = ConstantsUIColor.clearBackground

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
    }
    
    
    func UIInit(){
        logoImage()
        returnButton()
        titleLabel()
        welcomeLabel()
        emailField()
        passwordField()
        helpLabel()
        initSessionButton()
    }
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func returnButton(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: TextLocals.init_session_back_message, widthText: width/4)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func titleLabel(){
        view.addSubview(initSessionLabel)
        initSessionLabel.formartTitle(view: view, textTitle: TextLocals.init_session_top_message)
    }
    func welcomeLabel(){
        initSessionWelcomeLabel = UILabel()
        initSessionWelcomeLabel.text = TextLocals.init_session_description_message
        initSessionWelcomeLabel.font = UIFont(name: "some", size: 16)
        initSessionWelcomeLabel.textAlignment = .left
        initSessionWelcomeLabel.lineBreakMode = .byWordWrapping
        initSessionWelcomeLabel.numberOfLines = 0
        view.addSubview(initSessionWelcomeLabel)
        initSessionWelcomeLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionLabel)
    }
    func emailField(){
        fieldEmail = UIView()
        fieldEmail.formatUIView(activate: false)
        view.addSubview(fieldEmail)
        fieldEmail.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 46, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionWelcomeLabel)
        
        textFieldEmail = UITextField()
        textFieldEmail.formatTextField(TextLocals.init_session_email_input_message)
        textFieldEmail.keyboardType = .emailAddress
        fieldEmail.addSubview(textFieldEmail)
        textFieldEmail.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        
        
        textFieldLabelTop = UILabel()
        textFieldLabelTop.text = TextLocals.init_session_top_email_input_message
        textFieldLabelTop.font = UIFont(name: "some", size: 14)
        view.addSubview(textFieldLabelTop)
        textFieldLabelTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldEmail)
    }
    func passwordField(){
        fieldPassword = UIView()
        fieldPassword.formatUIView(activate: false)
        view.addSubview(fieldPassword)
        fieldPassword.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 45, right: 21, bottom: nil, withAnchor: .top, relativeToView: fieldEmail)
        
        textFieldPassword = UITextField()
        textFieldPassword.formatTextField(TextLocals.init_session_password_input_message)
        textFieldPassword.isSecureTextEntry = true
        fieldPassword.addSubview(textFieldPassword)
        textFieldPassword.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        
        
        passwordFieldLabelTop = UILabel()
        passwordFieldLabelTop.text = TextLocals.init_session_top_password_input_message
        passwordFieldLabelTop.font = UIFont(name: "some", size: 14)
        view.addSubview(passwordFieldLabelTop)
        passwordFieldLabelTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldPassword)
    }
    
    func initSessionButton(){
        initSessionBottomButton.formartBlueGreen()
        initSessionBottomButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(initSessionBottomButton)
        initSessionBottomButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        initSessionBottomButton.addLabelWhite(button: initSessionBottomButton, text: TextLocals.continue_button_message)
        
    }
    
    func helpLabel(){
        linkMessageButton = UIButton()
        linkMessageButton.formatTransparent()
        linkMessageButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(linkMessageButton)
        linkMessageButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
        
        linkMessageLabel = UILabel()
        linkMessageLabel.formatPurpleLink()
        linkMessageLabel.text = TextLocals.init_session_help_link
        linkMessageLabel.textAlignment = .center
        linkMessageButton.addSubview(linkMessageLabel)
        linkMessageLabel.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 10, right: 10, bottom: 10)
        
        helpMessageLabel = UITextField()
        helpMessageLabel.formatTextField(TextLocals.init_session_help_message)
        helpMessageLabel.textAlignment = .center
        linkMessageLabel.addSubview(helpMessageLabel)
        helpMessageLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 20)
        
        
        
    }
    
    

}
// MARK: - OBJC Functions
extension LoginViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
    }
}
