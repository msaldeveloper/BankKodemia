//
//  DetailAccountViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit

class DetailAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
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
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func continueButtonSection(){
        
        incomingButton.formartBlueGreen()
        //incomingButton.addTarget(self, action: #selector(continueButtonto), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: TextLocals.continue_button_message)
        
    }
}

// MARK: - OBJC Functions
extension CreateAccountViewController {
//    @objc func backAction(){
//        print("back button pressed")
//        dismiss(animated: true)
//    }
//    @objc func linkAction(){
//        print("link pressed")
//    }
    @objc func continueButtonto(){
        print("continue button pressed")
        
        //let detailAccountViewController = DetailAccountViewController()
        //detailAccountViewController.modalPresentationStyle = .fullScreen
        //present(detailAccountViewController, animated: true, completion: nil)
        
    }
}
