//
//  DetailAccountViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit

class DetailAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestDetailLabel: UILabel = UILabel()
    
    // DetailInfoFields: Indicaciones de la seccion
    var nameInfoFieldView: UIView = UIView()
    var lastNameInfoFieldView: UIView = UIView()
    var occupationInfoFieldView: UIView = UIView()
    var dateInfoFieldView: UIView = UIView()
    var infoFieldView: UIView = UIView()
    
    var nameInfoTextLabel: UILabel = UILabel()
    var latNameInfoTextLabel: UILabel = UILabel()
    var occupationInfoTextLabel: UILabel = UILabel()
    var dateInfoTextLabel: UILabel = UILabel()
    
    var nameInfoTextField: UITextField = UITextField()
    var lastNameInfoTextField: UITextField = UITextField()
    var occupationInfoTextField: UITextField = UITextField()
    var dateInfoTextField: UITextField = UITextField()
    
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    var legalTextLinkedLabel: UILabel = UILabel()
    
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
        nameDetailInfoField()
        lastNameDetailInfoField()
        occupationDetailInfoField()
        dateDetailInfoField()
        continueButtonSection()
       
        
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestDetailLabel = UILabel()
        infoSuggestDetailLabel.text = Text.CreateAccount.Detail.TopMessage
        infoSuggestDetailLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestDetailLabel.textAlignment = .left
        infoSuggestDetailLabel.lineBreakMode = .byWordWrapping
        infoSuggestDetailLabel.numberOfLines = 0
        view.addSubview(infoSuggestDetailLabel)
        infoSuggestDetailLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func nameDetailInfoField(){
        
        nameInfoFieldView = UIView()
        nameInfoFieldView.formatUIView(activate: false)
        view.addSubview(nameInfoFieldView)
        nameInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestDetailLabel)
        
        nameInfoFieldView.addSubview(nameInfoTextField)
        nameInfoTextField.infoTextFielFormat()
        
        nameInfoTextLabel = UILabel()
        nameInfoTextLabel.text = Text.CreateAccount.Detail.NameMessage
        nameInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        nameInfoTextField.addSubview(nameInfoTextLabel)
        nameInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: nameInfoFieldView)
        
    }
    
    func lastNameDetailInfoField(){
        
        lastNameInfoFieldView = UIView()
        lastNameInfoFieldView.formatUIView(activate: false)
        view.addSubview(lastNameInfoFieldView)
        lastNameInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: nameInfoFieldView)
        
        lastNameInfoFieldView.addSubview(lastNameInfoTextField)
        lastNameInfoTextField.infoTextFielFormat()
        
        latNameInfoTextLabel = UILabel()
        latNameInfoTextLabel.text = Text.CreateAccount.Detail.LastNameMessage
        latNameInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        lastNameInfoTextField.addSubview(latNameInfoTextLabel)
        latNameInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: lastNameInfoFieldView)
        
    }
    
    func occupationDetailInfoField(){
        
        occupationInfoFieldView = UIView()
        occupationInfoFieldView.formatUIView(activate: false)
        view.addSubview(occupationInfoFieldView)
        occupationInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: lastNameInfoFieldView)
        
        occupationInfoFieldView.addSubview(occupationInfoTextField)
        occupationInfoTextField.infoTextFielFormat()
        
        occupationInfoTextLabel = UILabel()
        occupationInfoTextLabel.text = Text.CreateAccount.Detail.OcupationMessage
        occupationInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        occupationInfoTextField.addSubview(occupationInfoTextLabel)
        occupationInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: occupationInfoFieldView)
        
    }
    
    func dateDetailInfoField(){
        
        dateInfoFieldView = UIView()
        dateInfoFieldView.formatUIView(activate: false)
        view.addSubview(dateInfoFieldView)
        dateInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: occupationInfoFieldView)
        
        dateInfoFieldView.addSubview(dateInfoTextField)
        dateInfoTextField.infoTextFielFormat()
        
        dateInfoTextLabel = UILabel()
        dateInfoTextLabel.text = Text.CreateAccount.Detail.Date
        dateInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        dateInfoFieldView.addSubview(dateInfoTextLabel)
        dateInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: dateInfoFieldView)
        
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
extension DetailAccountViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")

        let name = nameInfoTextLabel.text
        let lastname = lastNameInfoTextField.text
        let occupation = occupationInfoTextField.text
        let date = dateInfoTextLabel.text
      
        
        if ( occupation?.isEmpty )! || ( name?.isEmpty )! || ( lastname?.isEmpty )! || ( date?.isEmpty )!  {
            print("Llena correctamente los campos requeridos")
            
        } else {
            
            print("Bien hecho")
            let phoneAccountViewController = PhoneAccountViewController()
            phoneAccountViewController.modalPresentationStyle = .fullScreen
            present(phoneAccountViewController, animated: true, completion: nil)
            
        }
    }
}
