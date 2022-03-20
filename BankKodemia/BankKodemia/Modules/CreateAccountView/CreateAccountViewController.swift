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
    
    // Boton para continuar
    var incomingFieldView: UIView = UIView()
    var incomingTextLabel: UILabel = UILabel()
    var incomingTextLinkedLabel: UILabel = UILabel()
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
        incomingEmailSection()
        
    }
    
    func logoImage(){
        logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/80),
            logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20)
        ])
    }
    
    func suggestEmailSection(){
        
    }
    
    func createEmailSection(){
        
    }
    
    func incomingEmailSection(){
        
    }
    

}
