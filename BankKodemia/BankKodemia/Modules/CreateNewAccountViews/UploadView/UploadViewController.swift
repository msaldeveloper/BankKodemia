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
    //UploadBox
    var uploadboxView : UIView = UIView()
    var uploadboxLabel : UILabel = UILabel()
    var uploadboxButton : UIButton = UIButton()
    // Boton para continuar
    var uploadButton : UIButton = UIButton()
    
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
        uploadBoxSection()
        uploadButtonSection()
    
        
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.Uploading.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func uploadBoxSection(){
        
        uploadboxView = UIView()
        uploadboxView.formatUIViewDash(activate: false)
        view.addSubview(uploadboxView)
        uploadboxView.addAnchorsAndSize(width: nil, height: height/4, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        uploadboxButton.formatGray()
        uploadboxButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        uploadboxView.addSubview(uploadboxButton)
        uploadboxButton.addAnchorsAndSize(width: nil, height: 42, left: 0, top: 0, right: 0, bottom: 0)
        uploadboxButton.addLabelUploader(button: uploadboxButton, text: Text.CreateAccount.Uploading.BottonUploadMessage)

        
    }
    
    func uploadButtonSection(){
        
        uploadButton.formartBlueGreen()
        uploadButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
        view.addSubview(uploadButton)
        uploadButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        uploadButton.addLabelWhite(button: uploadButton, text: Text.CreateAccount.Uploading.BottonMessage)
        
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
    
    @objc func upload(){
        print("upload file")
    }

}
