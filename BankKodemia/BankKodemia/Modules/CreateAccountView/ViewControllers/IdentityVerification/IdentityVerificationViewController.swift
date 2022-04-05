//
//  IdentityVerificationViewController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit

class IdentityVerificationViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var arrowButton: UIButton = UIButton()
    var titleSuggestLabel: UILabel = UILabel()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    
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
        returnButton()
        titleLabel()
        suggestDetailInfoSection()
        legalInformationSection()
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func returnButton(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: Text.CreateAccount.PhoneVerification.title.uppercased(), widthText: width/4)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func titleLabel(){
        view.addSubview(titleSuggestLabel)
        titleSuggestLabel.formartTitle(view: view, textTitle: Text.CreateAccount.IdentityVerification.title)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.textColor = .black
        infoSuggestLabel.text = Text.CreateAccount.IdentityVerification.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func legalInformationSection(){
        
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: 37, left: 21, top: (height/20)*2, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
                        
        legalTextLabel = UILabel()
        legalTextLabel.textColor = .black
        legalTextLabel.text = Text.CreateAccount.IdentityVerification.BottonMessage
        legalTextLabel.numberOfLines = 0
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .justified
        view.addSubview(legalTextLabel)
        legalTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 20, right: 21, bottom: nil,withAnchor: .top, relativeToView: infoSuggestLabel)
        
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
extension IdentityVerificationViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        let idSelectViewController = IdSelectViewController()
        idSelectViewController.modalPresentationStyle = .fullScreen
        present(idSelectViewController, animated: true, completion: nil)
        
    }
}
