//
//  CreatePaswordViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var backgroundColor = ConstantsUIColor.clearBackground
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
    }
    
    func UIInit(){
        logoImage()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
}

