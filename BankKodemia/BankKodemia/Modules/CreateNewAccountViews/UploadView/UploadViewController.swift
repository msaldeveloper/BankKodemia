//
//  UploadViewController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit

class UploadViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel : UILabel = UILabel()
    

        
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
    
        
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = TextLocals.create_account_upload_top_message
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    
    
    
    
    
    
    func legalInformationSection(){
        
  
    }
    

    
    
    
    
    

}

// MARK: - OBJC Functions
extension UploadViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }

}
