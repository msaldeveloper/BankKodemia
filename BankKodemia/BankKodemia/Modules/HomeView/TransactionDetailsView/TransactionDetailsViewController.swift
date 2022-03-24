//
//  TransactionDetailsViewController.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 23/03/22.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    
    lazy var countButton : UIImageView = UIImageView()
    lazy var logo : UIImageView = UIImageView()
    lazy var helpButton : UIImageView = UIImageView()
    
    lazy var backButton : UIButton = UIButton()
    
    lazy var titleView : UILabel = UILabel()
    
    lazy var money : UILabel = UILabel()
    lazy var concept : UILabel = UILabel()
    
    lazy var dateLabel : UILabel = UILabel()
    lazy var dateDetail : UILabel = UILabel()
    
    lazy var idLabel : UILabel = UILabel()
    lazy var idDetail : UILabel = UILabel()
    
    lazy var conceptLabel : UILabel = UILabel()
    lazy var conceptDetail : UILabel = UILabel()
    
    lazy var countLabel : UILabel = UILabel()
    lazy var countDetail : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
    }
    
    func initUI(){
        
        view.addSubview(countButton)
        countButton.countFormart(view: view)
        
        view.addSubview(helpButton)
        helpButton.helpFormart(view: view)
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.tab_bar_init, widthText: width/7)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: TextLocals.home_transaction_detail)
        
        money.text = "$9100"
        money.textAlignment = .center
        money.font = UIFont(name: "Poppins-Bold", size: height/35)
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            money.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            money.topAnchor.constraint(equalTo: view.topAnchor, constant: height/5),
            money.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9)
        ])
        
        concept.text = "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
        concept.textAlignment = .center
        concept.numberOfLines = 0
        concept.textColor = ConstantsUIColor.greyKodemia
        concept.font = UIFont(name: "Poppins-Medium", size: height/50)
        view.addSubview(concept)
        concept.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            concept.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            concept.topAnchor.constraint(equalTo: money.bottomAnchor, constant: 0),
            concept.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9)
        ])
        
        dateLabel = UILabel(frame: CGRect(x: width/18, y: height/3, width: 8*width/9, height: height/30))
        dateLabel.text = TextLocals.home_date_message
        
        
        
    }
    
}

// MARK: - OBJC Functions
extension TransactionDetailsViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
    }
}
