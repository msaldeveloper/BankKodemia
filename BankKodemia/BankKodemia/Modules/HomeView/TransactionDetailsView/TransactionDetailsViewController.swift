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
    
    lazy var recipientUserLabel : UILabel = UILabel()
    lazy var recipientUserDetail : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
    }
    
    var transaction : TransactionModel = TransactionModel(id: "", amount: 0, type: "", concept: "", createdAt: "", issuer: User(_id: "", email: "", name: "", lastName: ""), destinationUser: User(_id: "", email: "", name: "", lastName: ""), isIncome: false)
    
    init(transaction: TransactionModel){
        super.init(nibName: nil, bundle: nil)
        
        self.transaction = transaction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.tab_bar_init, widthText: width/7)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: TextLocals.home_transaction_detail)
        
        money.text = "$"+String(transaction.amount)
        money.textColor = .black
        money.textAlignment = .center
        money.font = ConstantsFont.f20SemiBold
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            money.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            money.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 3*height/120),
            money.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9)
        ])
        
        concept.text = transaction.concept
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
        
        dateDetail.text = transaction.createdAt
        dateDetail.font = ConstantsFont.f14Regular
        dateDetail.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(dateDetail)
        dateDetail.listDetails(view: view, previous: dateLabel, height: 2/30)
        
        idLabel.text = TextLocals.home_id_transaction_message
        idLabel.font = ConstantsFont.f14SemiBold
        idLabel.textColor = .darkGray
        view.addSubview(idLabel)
        idLabel.listDetails(view: view, previous: dateDetail, height: 1/30)
        
        idDetail.text = transaction.id
        idDetail.font = ConstantsFont.f14Regular
        idDetail.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(idDetail)
        idDetail.listDetails(view: view, previous: idLabel, height: 2/30)
        
        conceptLabel.text = TextLocals.home_concept_message
        conceptLabel.font = ConstantsFont.f14SemiBold
        conceptLabel.textColor = .darkGray
        view.addSubview(conceptLabel)
        conceptLabel.listDetails(view: view, previous: idDetail, height: 1/30)
        
        conceptDetail.text = transaction.concept
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
        \(transaction.issuer.name)
        Numero de cuenta
        \(transaction.issuer._id)
        """
        countDetail.font = ConstantsFont.f14Regular
        countDetail.textColor = ConstantsUIColor.greyKodemia
        countDetail.numberOfLines = 3
        view.addSubview(countDetail)
        countDetail.listDetails(view: view, previous: countLabel, height: 3/30)
        
        if transaction.destinationUser.name != "" {
            recipientUserLabel.text = "Receptor"
            recipientUserLabel.font = ConstantsFont.f14SemiBold
            recipientUserLabel.textColor = .darkGray
            view.addSubview(recipientUserLabel)
            recipientUserLabel.listDetails(view: view, previous: countDetail, height: 1/30)
            
            recipientUserDetail.text = transaction.destinationUser.name + " " + transaction.destinationUser.lastName
            recipientUserDetail.font = ConstantsFont.f14Regular
            recipientUserDetail.textColor = .darkGray
            view.addSubview(recipientUserDetail)
            recipientUserDetail.listDetails(view: view, previous: recipientUserLabel, height: 1/30)
        }
        
    }
    
}

// MARK: - OBJC Functions
extension TransactionDetailsViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}
