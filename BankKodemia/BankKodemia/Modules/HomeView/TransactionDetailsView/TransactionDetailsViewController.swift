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
        money.font = ConstantsFont.f20SemiBold
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            money.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            money.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 3*height/120),
            money.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9)
        ])
        
        concept.text = "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
        concept.textAlignment = .center
        concept.numberOfLines = 0
        concept.textColor = .darkGray
        concept.font = ConstantsFont.f14Normal
        view.addSubview(concept)
        concept.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            concept.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            concept.topAnchor.constraint(equalTo: money.bottomAnchor, constant: 0),
            concept.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            concept.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/15)
        ])
        
        dateLabel.text = TextLocals.home_date_message
        dateLabel.font = ConstantsFont.f14SemiBold
        dateLabel.textColor = .darkGray
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: money.bottomAnchor, constant:height/7),
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            dateLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/30)
        ])
        
        dateDetail.text = "25 de enero de 2022 9 p.m."
        dateDetail.font = ConstantsFont.f14Regular
        dateDetail.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(dateDetail)
        dateDetail.listDetails(view: view, previous: dateLabel, height: 2/30)
        
        idLabel.text = TextLocals.home_id_transaction_message
        idLabel.font = ConstantsFont.f14SemiBold
        idLabel.textColor = .darkGray
        view.addSubview(idLabel)
        idLabel.listDetails(view: view, previous: dateDetail, height: 1/30)
        
        idDetail.text = "8973482774072974827483229738"
        idDetail.font = ConstantsFont.f14Regular
        idDetail.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(idDetail)
        idDetail.listDetails(view: view, previous: idLabel, height: 2/30)
        
        conceptLabel.text = TextLocals.home_concept_message
        conceptLabel.font = ConstantsFont.f14SemiBold
        conceptLabel.textColor = .darkGray
        view.addSubview(conceptLabel)
        conceptLabel.listDetails(view: view, previous: idDetail, height: 1/30)
        
        conceptDetail.text = "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
        conceptDetail.font = ConstantsFont.f14Regular
        conceptDetail.textColor = ConstantsUIColor.greyKodemia
        conceptDetail.numberOfLines = 2
        view.addSubview(conceptDetail)
        conceptDetail.listDetails(view: view, previous: conceptLabel, height: 2/30)
        
        countLabel.text = TextLocals.home_issuing_account
        countLabel.font = ConstantsFont.f14SemiBold
        countLabel.textColor = .darkGray
        view.addSubview(countLabel)
        countLabel.listDetails(view: view, previous: conceptDetail, height: 1/30)
        
        countDetail.text = """
        Numero de cuenta
        0000 2052 14
        """
        countDetail.font = ConstantsFont.f14Regular
        countDetail.textColor = ConstantsUIColor.greyKodemia
        countDetail.numberOfLines = 2
        view.addSubview(countDetail)
        countDetail.listDetails(view: view, previous: countLabel, height: 2/30)
        
    }
    
}

// MARK: - OBJC Functions
extension TransactionDetailsViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}
