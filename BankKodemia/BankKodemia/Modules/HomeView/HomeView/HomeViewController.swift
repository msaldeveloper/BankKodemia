//
//  ViewController.swift
//  Pruebas
//
//  Created by Felipe Nery Guevara Guevara on 15/03/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    
    lazy var countButton : UIImageView = UIImageView()
    lazy var logo : UIImageView = UIImageView()
    lazy var helpButton : UIImageView = UIImageView()
    lazy var moneyTitle : UILabel = UILabel()
    lazy var money : UILabel = UILabel()
    lazy var sendMoneyButton : UIButton = UIButton()
    lazy var sendMoneyLabel : UILabel = UILabel()
    lazy var receivingMoneyButton : UIButton = UIButton()
    lazy var receivingMoneyLabel : UILabel = UILabel()
    lazy var movementsTable : UITableView = UITableView()

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
        
        view.addSubview(moneyTitle)
        moneyTitle.formartTitle(view: view, textTitle: TextLocals.home_available_cash_top_message)
        
        money.text = "$160.00"
        money.textAlignment = .center
        money.font = ConstantsFont.f20SemiBold
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            money.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            money.topAnchor.constraint(equalTo: moneyTitle.bottomAnchor, constant: 3*height/120),
            money.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5)
        ])
        
        sendMoneyButton.formartClear()
        view.addSubview(sendMoneyButton)
        sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendMoneyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width/18),
            sendMoneyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 11*height/40),
            sendMoneyButton.widthAnchor.constraint(equalToConstant: 5*width/12),
        ])
        sendMoneyButton.addLabelGreenblue(button: sendMoneyButton, text: TextLocals.home_send_button)
        
        
        receivingMoneyButton.formartBlueGreen()
        view.addSubview(receivingMoneyButton)
        receivingMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            receivingMoneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width/18),
            receivingMoneyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 11*height/40),
            receivingMoneyButton.widthAnchor.constraint(equalToConstant: 5*width/12),
        ])
        receivingMoneyButton.addLabelWhite(button: receivingMoneyButton, text: TextLocals.home_receive_button)
        
        
        movementsTable.backgroundColor = .systemGray5
        movementsTable.layer.cornerRadius = 10
        view.addSubview(movementsTable)
        movementsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movementsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movementsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 27*height/80),
            movementsTable.widthAnchor.constraint(equalToConstant: width),
            movementsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8/13)
        ])
        
        
    }
    


}

