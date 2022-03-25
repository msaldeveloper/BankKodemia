//
//  AddNewRecipientViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 25/03/22.
//

import UIKit

class AddNewRecipientViewController: UIViewController {
    var backgroundColor = ConstantsUIColor.clearBackground
    var arrowButton: UIButton = UIButton()
    var logo : UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
    }
    func initUI(){
        logoComponent()
        backButtonComponent()
    }
    func logoComponent(){
        view.addSubview(logo)
        logo.logoFormart(view: view
        )
    }
    func backButtonComponent(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: TextLocals.init_session_back_message, widthText: width/2)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }

}
