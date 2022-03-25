//
//  LoadingViewController.swift
//  BankKodemia
//
//  Created by MacBook on 23/03/22.
//

import UIKit

class LoadingViewController: UIViewController {
    lazy var logoXL : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel: UILabel = UILabel()
    var loadingMessageLabel: UILabel = UILabel()

    
    var updating = Text.CreateAccount.Loading.UpdatingMessage
    var Transaction = Text.CreateAccount.Loading.TransactionMessage
    
    var backgroundColor = ConstantsUIColor.clearBackground
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
    }
    
    func UIInit(){
        logoImageXL()
        suggestInfoSection()
    }
    
    func logoImageXL(){
        view.addSubview(logoXL)
        logoXL.logoFormartXL(view: view)
    }
    
    func suggestInfoSection(){
        
        loadingMessageLabel = UILabel()
        loadingMessageLabel.text = Text.CreateAccount.Loading.UpdatingMessage
        loadingMessageLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        loadingMessageLabel.textAlignment = .center
        loadingMessageLabel.lineBreakMode = .byWordWrapping
        loadingMessageLabel.numberOfLines = 2
        view.addSubview(loadingMessageLabel)
        loadingMessageLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: (height/5)*2, withAnchor: .top, relativeToView: logoXL)
        
    }

}

// MARK: - OBJC Functions
extension LoadingViewController {
    
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
