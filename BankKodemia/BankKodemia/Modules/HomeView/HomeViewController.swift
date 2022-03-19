//
//  ViewController.swift
//  Pruebas
//
//  Created by Felipe Nery Guevara Guevara on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

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
        
        countButton = UIImageView(frame: CGRect(x: 3*width/40, y: height/16, width: width/15, height: width/15))
        countButton.image = UIImage(named: "count")
        view.addSubview(countButton)
        
        helpButton = UIImageView(frame: CGRect(x: width - 3*width/40 - width/15, y: height/16, width: width/15, height: width/15))
        helpButton.image = UIImage(named: "help")
        view.addSubview(helpButton)
        
//        logo = UIImageView(frame: CGRect(x: 29*width/72, y: height/20, width: 7*width/36, height: width/9))
//        logo.image = UIImage(named: "logo")
//        view.addSubview(logo)
        
        logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/80),
            logo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11)
        ])
        
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
        
        sendMoneyLabel = UILabel(frame: CGRect(x: 0, y: 3*height/400, width: 5*width/12, height: 9*height/400))
        sendMoneyLabel.font = .boldSystemFont(ofSize: 9*height/400)
        sendMoneyLabel.textColor = ConstantsUIColor.greenBlue
        sendMoneyLabel.textAlignment = .center
        sendMoneyLabel.text = "Enviar"
        
        sendMoneyButton.addSubview(sendMoneyLabel)
        
        receivingMoneyButton = UIButton(frame: CGRect(x: width - width/18 - 5*width/12, y: 11*height/40, width: 5*width/12, height: 3*height/80))
        receivingMoneyButton.formartBlueGreen()
        
        view.addSubview(receivingMoneyButton)
        
        receivingMoneyLabel = UILabel(frame: CGRect(x: 0, y: 3*height/400, width: 5*width/12, height: 9*height/400))
        receivingMoneyLabel.font = .boldSystemFont(ofSize: 9*height/400)
        receivingMoneyLabel.textColor = .white
        receivingMoneyLabel.textAlignment = .center
        receivingMoneyLabel.text = "Recibir"
        
        receivingMoneyButton.addSubview(receivingMoneyLabel)
        
        movementsTable = UITableView(frame: CGRect(x: 0, y: 27*height/80, width: width, height: height - height/10 - 27*height/80))
        movementsTable.backgroundColor = .systemGray5
        
        view.addSubview(movementsTable)
        
        
    }
    


}

