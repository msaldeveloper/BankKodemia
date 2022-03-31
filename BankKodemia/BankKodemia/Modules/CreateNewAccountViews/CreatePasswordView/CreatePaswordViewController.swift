//
//  CreatePaswordViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit
import SwiftUI

class CreatePasswordViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    var legalTopLabel: UILabel = UILabel()
    var legalBottomLabel: UILabel = UILabel()
    
    // FieldsViews
    var createPasswordFieldView: UIView = UIView()
    var confirmPasswordFieldView: UIView = UIView()
    
    //Labels
    var createPasswordTextLabel: UILabel = UILabel()
    var confirmPasswordTextLabel: UILabel = UILabel()
    
    //TextFiels
    var createPasswordTextField: UITextField = UITextField()
    var confirmPasswordTextField: UITextField = UITextField()
    
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
        suggestInfoSection()
        createPasswordField()
        confirmPasswordField()
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestInfoSection(){
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.CreatePassword.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
        legalTopLabel = UILabel()
        legalTopLabel.text = Text.CreateAccount.CreatePassword.MediumMessage
        legalTopLabel.font = UIFont(name: "Poppins", size: 16)
        legalTopLabel.textAlignment = .left
        legalTopLabel.lineBreakMode = .byWordWrapping
        legalTopLabel.numberOfLines = 0
        view.addSubview(legalTopLabel)
        legalTopLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/40, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        legalBottomLabel = UILabel()
        legalBottomLabel.text = Text.CreateAccount.CreatePassword.BottomMessage
        legalBottomLabel.font = UIFont(name: "Poppins", size: 16)
        legalBottomLabel.textAlignment = .left
        legalBottomLabel.lineBreakMode = .byWordWrapping
        legalBottomLabel.numberOfLines = 0
        view.addSubview(legalBottomLabel)
        legalBottomLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/40, right: 21, bottom: nil, withAnchor: .top, relativeToView: legalTopLabel)
        

    }
    
    func createPasswordField(){
        createPasswordFieldView = UIView()
        createPasswordFieldView.formatUIView(activate: false)
        view.addSubview(createPasswordFieldView)
        createPasswordFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: legalBottomLabel)
        
        createPasswordFieldView.addSubview(createPasswordTextField)
        createPasswordTextField.infoTextFielFormat()
        
        createPasswordTextLabel = UILabel()
        createPasswordTextLabel.text = Text.CreateAccount.CreatePassword.CreateLabel
        createPasswordTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        createPasswordFieldView.addSubview(createPasswordTextLabel)
        createPasswordTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: createPasswordFieldView)
    }
    
    func confirmPasswordField(){
        confirmPasswordFieldView = UIView()
        confirmPasswordFieldView.formatUIView(activate: false)
        view.addSubview(confirmPasswordFieldView)
        confirmPasswordFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: createPasswordFieldView)
        
        confirmPasswordFieldView.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.infoTextFielFormat()
        
        confirmPasswordTextLabel = UILabel()
        confirmPasswordTextLabel.text = Text.CreateAccount.CreatePassword.ConfirmLabel
        confirmPasswordTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        confirmPasswordFieldView.addSubview(confirmPasswordTextLabel)
        confirmPasswordTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: confirmPasswordFieldView)
        
    }
    
    func continueButtonSection(){
        incomingButton.formartBlueGreen()
        incomingButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: Text.CreateAccount.CreatePassword.ButtonCreateMessage)
    }
    
}

// MARK: - OBJC Functions
extension CreatePasswordViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        
        let createPassword = createPasswordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if createPassword == confirmPassword {
            print("Las contraseñas coinciden")

            let regexPassword = "^(?=.{8,}$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$"
            if (createPassword?.range(of: regexPassword, options: .regularExpression, range: nil, locale: nil) != nil) {

                let successViewController = SuccessViewController()
                successViewController.modalPresentationStyle = .fullScreen
                present(successViewController, animated: true, completion: nil)
            }else{
                print("Llena correctamente los campos requeridos")
            }
        } else{
            print("Las contraseñas NO coinciden")
        }
        
      

        
    }
}

