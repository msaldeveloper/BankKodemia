//
//  WelcomeViewController.swift
//  BankKodemia
//
//  Created by Mariela Torres on 23/03/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var contentStackView: UIStackView = UIStackView()
    
    private lazy var bankodemiaLogo : UIImageView = UIImageView()

    private lazy var welcomeLabel : UILabel = UILabel()
    
    private lazy var welcomeLogo : UIImageView = UIImageView()
    
    private lazy var SignUpButton : UIButton = UIButton()
    
    private lazy var LogInButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantsUIColor.blackKodemia
        initUI()
    }
    
    func initUI(){
        // Configurando stack view
        contentStackView.axis = .vertical
        contentStackView.spacing = 100
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
        
        welcomeLogo.image = UIImage(named: "app")
        contentStackView.addArrangedSubview(welcomeLogo)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bankodemiaLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            bankodemiaLogo.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bankodemiaLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            welcomeLabel.topAnchor.constraint(equalTo: bankodemiaLogo.bottomAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLogo.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            welcomeLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            welcomeLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLogo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
    }
    
    
}
