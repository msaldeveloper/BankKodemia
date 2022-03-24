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
        
        moneyTitle = UILabel(frame: CGRect(x: width/18, y: 11*height/80, width: 29*width/72, height: height/40))
        moneyTitle.text = "DINERO DISPONIBLE"
        moneyTitle.font = .systemFont(ofSize: 50)
        moneyTitle.adjustsFontSizeToFitWidth = true
        view.addSubview(moneyTitle)
        
        money = UILabel(frame: CGRect(x: width/5, y: height/5, width: 3*width/5, height: 3*height/80))
        money.text = "$160.00"
        money.textAlignment = .center
        money.font = .boldSystemFont(ofSize: height/40)
        
        view.addSubview(money)
        
        sendMoneyButton = UIButton(frame: CGRect(x: width/18, y: 11*height/40, width: 5*width/12, height: 3*height/80))
        sendMoneyButton.formartClear()
        
        view.addSubview(sendMoneyButton)
        
        sendMoneyButton.addLabelGreenblue(button: sendMoneyButton, text: "Enviar")
        
        
        receivingMoneyButton = UIButton(frame: CGRect(x: width - width/18 - 5*width/12, y: 11*height/40, width: 5*width/12, height: 3*height/80))
        receivingMoneyButton.formartBlueGreen()
        
        view.addSubview(receivingMoneyButton)
        
        receivingMoneyButton.addLabelWhite(button: receivingMoneyButton, text: "Recibir")
        
        movementsTable = UITableView(frame: CGRect(x: 0, y: 27*height/80, width: width, height: height - height/10 - 27*height/80))
        movementsTable.backgroundColor = .systemGray5
        
        view.addSubview(movementsTable)
        
        
    }
    


}

