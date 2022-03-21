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
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestEmailSection(){
        
        
//        infoSuggestLabel = UILabel()
//        infoSuggestLabel.text = TextLocals.create_account_description_message
//        infoSuggestLabel.font = UIFont(name: "Poppins-SemiBold", size: 18)
//        infoSuggestLabel.textAlignment = .left
//        infoSuggestLabel.lineBreakMode = .byWordWrapping
//        infoSuggestLabel.numberOfLines = 0
//        view.addSubview(infoSuggestLabel)
//        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: arrowButton)
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = TextLocals.init_session_description_message
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
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
        
    }
}


