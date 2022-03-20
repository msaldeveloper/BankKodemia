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
        arrowButton = UIButton()
        arrowButton.backButton(TextLocals.create_account_top_message)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(arrowButton)
        arrowButton.addAnchorsAndSize(width: 100, height: nil, left: 20.5, top: (height/100)*18, right: nil, bottom: nil)
        
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = TextLocals.create_account_description_message
        infoSuggestLabel.font = UIFont(name: "Poppins-SemiBold", size: 18)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
    }
    
    func createEmailSection(){
        
    }
    
    func incomingEmailSection(){
        
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
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
    }
}
