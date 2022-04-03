//
//  WelcomeViewController.swift
//  BankKodemia
//
//  Created by Mariela Torres on 23/03/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: -Stack views
    private lazy var contentStackView: UIStackView = UIStackView()
    private lazy var buttonStackView : UIStackView = UIStackView()
    
    // MARK: -Upper screen elements
    private lazy var bankodemiaLogo : UIImageView = UIImageView()

    private lazy var welcomeLabel : UILabel = UILabel()
    
    private lazy var welcomeLabelNote : UILabel = UILabel()
    
    private lazy var welcomeLogo : UIImageView = UIImageView()
    
    // MARK: -Buttons
    private lazy var signUpButton : UIButton = UIButton()
    
    private lazy var logInButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantsUIColor.blackKodemia
        initUI()
    }
    
    func initUI(){
        // Configurando stack view
        contentStackView.axis = .vertical
        contentStackView.spacing = 50
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        
        view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        bankodemiaLogo.image = UIImage(named: "logo-2")
        contentStackView.addArrangedSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.text = TextLocals.init_session_welcome_message_top
        welcomeLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        contentStackView.addArrangedSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let note: String = TextLocals.init_session_welcome_message_bottom
        let attributedString = NSMutableAttributedString(string: note)
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 16))
        attributedString.addAttribute(.foregroundColor, value: UIColor.cyan, range: NSRange(location: 16, length: 2))
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 18, length: 7))
        welcomeLabelNote.attributedText = attributedString
        
//        welcomeLabelNote.text = TextLocals.init_session_welcome_message_bottom
        welcomeLabelNote.font = UIFont(name: "Poppins-SemiBold", size: 18)
//        welcomeLabelNote.textColor = .white
        welcomeLabelNote.textAlignment = .center
        contentStackView.addArrangedSubview(welcomeLabelNote)
        welcomeLabelNote.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLogo.image = UIImage(named: "app")
        contentStackView.addArrangedSubview(welcomeLogo)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bankodemiaLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            bankodemiaLogo.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankodemiaLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            welcomeLabel.topAnchor.constraint(equalTo: bankodemiaLogo.bottomAnchor, constant: 15),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabelNote.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            welcomeLabelNote.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLogo.topAnchor.constraint(equalTo: welcomeLabelNote.bottomAnchor, constant: 20),
            welcomeLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            welcomeLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLogo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        // Configurando button stack view
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 30
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        signUpButton.formartBlueGreen()
        signUpButton.addLabelWhite(button: signUpButton, text: TextLocals.init_session_create_account_button_message)
        signUpButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        buttonStackView.addArrangedSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        logInButton.formartClear()
        logInButton.addLabelGreenblue(button: logInButton, text: TextLocals.init_session_button_message)
        logInButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        buttonStackView.addArrangedSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -30)
        ])
    }
}

// MARK: - OBJC Functions
extension WelcomeViewController {
    @objc func goToSignUp(){
        print("Vamos a crear la cuenta...")
        
        let createAccountViewController = CreateAccountViewController()
        createAccountViewController.modalPresentationStyle = .fullScreen
        present(createAccountViewController, animated: true, completion: nil)
        
    }
    @objc func goToLogIn(){
        print("Vamos a loguearnos...")
        
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
