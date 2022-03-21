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
        logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/80),
            logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11)
        ])
    }
    
    func returnButton(){
        
        arrowButton = UIButton()
        arrowButton.backButton(TextLocals.init_session_back_message)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        //arrowButton?.backgroundColor = .purple
        view.addSubview(arrowButton)
        arrowButton.addAnchorsAndSize(width: 100, height: nil, left: 20.5, top: 90, right: nil, bottom: nil)
    }
    
    func titleLabel(){
        initSessionLabel = UILabel()
        initSessionLabel.text = TextLocals.init_session_top_message
        initSessionLabel.font = UIFont(name: "some", size: 14)
        //initSessionLabel.backgroundColor = .red
        view.addSubview(initSessionLabel)
        initSessionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            initSessionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            initSessionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/15),
            //logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11)
        ])
        //initSessionLabel.addAnchorsAndSize(width: 107, height: 21, left: nil, top: 125, right: nil, bottom: nil)
        //, withAnchor: <#T##Anchor?#>, relativeToView: <#T##UIView?#>
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
        initSessionBottomButton = UIButton()
        initSessionBottomButton.formartBlueGreen()
        initSessionBottomButton.layer.cornerRadius = 4
        initSessionBottomButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(initSessionBottomButton)
        initSessionBottomButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        initSessionButtonLabel = UILabel()
        initSessionButtonLabel.formartWhite()
        initSessionButtonLabel.textAlignment = .center
        initSessionButtonLabel.font = .boldSystemFont(ofSize: 18)
        initSessionButtonLabel.text = TextLocals.continue_button_message
        initSessionBottomButton.addSubview(initSessionButtonLabel)
        initSessionButtonLabel.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 10, right: 10, bottom: nil)
        
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
        //helpMessageLabel.backgroundColor = .red
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
