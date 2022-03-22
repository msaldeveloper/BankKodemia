//
//  PhoneAccountController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit

class PhoneAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    
    // PhoneInfoFields: Indicaciones de la seccion
    var phoneInfoFieldView: UIView = UIView()
    var phoneInfoTextLabel: UILabel = UILabel()
    var phoneInfoTextField: UITextField = UITextField()
    
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
        phoneInfoFieldSection()
        legalInformationSection()
        continueButtonSection()
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = TextLocals.create_account_data_input_top_message
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func phoneInfoFieldSection(){
        
        phoneInfoFieldView = UIView()
        phoneInfoFieldView.formatUIView(activate: false)
        view.addSubview(phoneInfoFieldView)
        phoneInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        phoneInfoFieldView.addSubview(phoneInfoTextField)
        phoneInfoTextField.infoTextFielFormat()
        
        phoneInfoTextLabel = UILabel()
        phoneInfoTextLabel.text = TextLocals.create_account_data_input_phone_number_message
        phoneInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        phoneInfoTextField.addSubview(phoneInfoTextLabel)
        phoneInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: phoneInfoFieldView)
        
        
    }
    
    func legalInformationSection(){
        
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
                        
        legalTextLabel = UILabel()
        legalTextLabel.text = TextLocals.create_account_data_input_botton_message
        legalTextLabel.numberOfLines = 0
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .center
        legalButton.addSubview(legalTextLabel)
        legalTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 20)
        
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
extension PhoneAccountViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
//        let detailAccountViewController = DetailAccountViewController()
//        detailAccountViewController.modalPresentationStyle = .fullScreen
//        present(detailAccountViewController, animated: true, completion: nil)
        
    }
}
