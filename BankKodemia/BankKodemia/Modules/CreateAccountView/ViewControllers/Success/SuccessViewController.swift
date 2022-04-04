//
//  SuccessViewController.swift
//  BankKodemia
//
//  Created by MacBook on 23/03/22.
//

import UIKit

class SuccessViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var success : UIImageView = UIImageView()
   
    // ImageXL
    var imageXLView: UIView = UIView()
    
    // Success Messagge
    var successView: UIView = UIView()
    var infoSuggestLabel : UILabel = UILabel()
    var thanksLabel : UILabel = UILabel()
    
    // Boton para continuar
    var incomingButton: UIButton = UIButton()
    
    var backgroundColor = ConstantsUIColor.clearBackground

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()
        
    }
    
    func UIInit(){
        logoImage()
        imageXL()
        suggestInfoSection()
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)

//        view.addSubview(success)
//        success.logoFormartXL(view: view)
//        success.image = UIImage(named: "success")
    }
    
    func imageXL(){
        imageXLView = UIView()
        imageXLView .formatUIViewClear(activate: true)
        view.addSubview(imageXLView )
        imageXLView .addAnchorsAndSize(width: nil, height: height/5, left: 21, top: height/8, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
        imageXLView.addSubview(success)
        success.logoImageXL(view: view)
        success.image = UIImage(named: "success")
        
    }
    
    func suggestInfoSection(){
        successView = UIView()
        successView.formatUIViewClear(activate: true)
        view.addSubview(successView)
        successView.addAnchorsAndSize(width: nil, height: height/7, left: 21, top: 0, right: 21, bottom: nil, withAnchor: .top, relativeToView: imageXLView)
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.Success.ConfirmationMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 17)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 4
        successView.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: nil, withAnchor: .top, relativeToView: imageXLView)
        
        thanksLabel = UILabel()
        thanksLabel.text = Text.CreateAccount.Success.ThakYouMessage
        thanksLabel.font = UIFont(name: "Poppins-Medium", size: 18)
        thanksLabel.textColor = ConstantsUIColor.purpleLink
        thanksLabel.textAlignment = .center
        thanksLabel.lineBreakMode = .byWordWrapping
        thanksLabel.numberOfLines = 4
        successView.addSubview(thanksLabel)
        thanksLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/9, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
    }
    
    func continueButtonSection(){
        incomingButton.formartBlueGreen()
        incomingButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: Text.CreateAccount.Success.FinishMessage)
    }
}

// MARK: - OBJC Functions
extension SuccessViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
