//
//  SuccessViewController.swift
//  BankKodemia
//
//  Created by MacBook on 23/03/22.
//

import UIKit

class SuccessViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var success : UIImageView = UIImageView()
    
    var infoSuggestLabel : UILabel = UILabel()
    
    var backgroundColor = ConstantsUIColor.clearBackground

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()
        
    }
    
    func UIInit(){
        logoImage()
        succesImage()
        suggestInfoSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func succesImage(){
        view.addSubview(success)
        success.logoFormartXL(view: view)
    }
    
    func suggestInfoSection(){
        
    }
    

   

}
