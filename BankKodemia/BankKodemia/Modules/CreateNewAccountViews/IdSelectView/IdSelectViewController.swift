//
//  IdSelectViewController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit

class IdSelectViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel : UILabel = UILabel()
    
    // IdSelectorButtons: Botones
    var ineView : UIView = UIView()
    var passportView : UIView = UIView()
    var immigrantDocumentView : UIView = UIView()
    
    var ineButton : UIButton = UIButton()
    var passportButton : UIButton = UIButton()
    var immigrantDocumentButton : UIButton = UIButton()
    
    var ineButtonLabel : UIButton = UIButton()
    var passportButtonLabel : UIButton = UIButton()
    var immigrantDocumentButtonlabel : UIButton = UIButton()
    
    var arrowButton : UIImageView = UIImageView()
    var ineRightArrow : UIImageView = UIImageView()
    var passportRightArrow : UIImageView = UIImageView()
    var immigrantDocumentRightArrow : UIImageView = UIImageView()
        
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

        // Do any additional setup after loading the view.
    }
    
    func UIInit(){
        logoImage()
        suggestDetailInfoSection()
        ineSelectorButton()
        immigrantDocumentSelectorButton()
        passportSelectorButton()
        legalInformationSection()
        
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = TextLocals.create_account_idselect_top_message
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func ineSelectorButton(){
        
        ineView  = UIView()
        ineView.formatUIViewClear(activate: true)
        view.addSubview(ineView )
        ineView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        
        ineButton.formatPhantom()
        ineButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        ineView.addSubview(ineButton)
        ineButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        ineButton.addLabelDarkGray(button: ineButton, text: TextLocals.create_account_idselect_ine)
        
        ineView.addSubview(ineRightArrow)
        ineRightArrow.arrowButtonIdentity(view: view)

    }
    
    func immigrantDocumentSelectorButton(){
        
        immigrantDocumentView = UIView()
        immigrantDocumentView.formatUIViewClear(activate: true)
        view.addSubview(immigrantDocumentView )
        immigrantDocumentView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: ineView)
        
        
        immigrantDocumentButton.formatPhantom()
        immigrantDocumentButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        immigrantDocumentView.addSubview(immigrantDocumentButton)
        immigrantDocumentButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        immigrantDocumentButton.addLabelDarkGray(button: immigrantDocumentButton, text: TextLocals.create_account_idselect_documento_migratorio)
        
        immigrantDocumentView.addSubview(immigrantDocumentRightArrow)
        immigrantDocumentRightArrow.arrowButtonIdentity(view: view)
        
    }
    
    func passportSelectorButton(){
        
        passportView = UIView()
        passportView.formatUIViewClear(activate: true)
        view.addSubview(passportView)
        passportView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: immigrantDocumentView)
        
        
        passportButton.formatPhantom()
        passportButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        passportView.addSubview(passportButton)
        passportButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        passportButton.addLabelDarkGray(button: passportButton, text: TextLocals.create_account_idselect_pasaporte)
        
        passportView.addSubview(passportRightArrow)
        passportRightArrow.arrowButtonIdentity(view: view)
        
    }
    
    func legalInformationSection(){
        
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
                        
        legalTextLabel = UILabel()
        legalTextLabel.text = TextLocals.create_account_idselect_bottom_message
        legalTextLabel.numberOfLines = 0
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .center
        legalButton.addSubview(legalTextLabel)
        legalTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: 0, bottom: 20)

    }
    

    
    
    
    
    

}

// MARK: - OBJC Functions
extension IdSelectViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        let uploadViewController = UploadViewController()
        uploadViewController.modalPresentationStyle = .fullScreen
        present(uploadViewController, animated: true, completion: nil)
        
    }
}
