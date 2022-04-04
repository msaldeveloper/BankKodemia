//
//  ViewController.swift
//  Pruebas
//
//  Created by Felipe Nery Guevara Guevara on 15/03/22.
//

import Foundation
import UIKit
import Combine

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
    
    var homeViewModel : HomeViewModel = HomeViewModel()
    var movementsList : [TransactionModel] = []
    
    private var cancellables: [AnyCancellable] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
        
        movementsTable.delegate = self
        movementsTable.dataSource = self
        
        receiveBalance()
        newData()
        reloadData()
        
        homeViewModel.leadData()
        
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
        
        
        movementsTable.backgroundColor = .white
        view.addSubview(movementsTable)
        movementsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movementsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movementsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 27*height/80),
            movementsTable.widthAnchor.constraint(equalToConstant: width),
            movementsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8/13)
        ])
        
        
    }
    
    //suscriptor para traer la data del tablaView
    fileprivate func newData(){
        self.homeViewModel
            .dataTableView
            .sink{ newList in
                self.movementsList = newList
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para saber cuando recargar la data de la tableView
    fileprivate func reloadData(){
        self.homeViewModel
            .reloadDataTableView
            .sink{ _ in
                DispatchQueue.main.async {
                    self.movementsTable.reloadData()
                }
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para traer el balance del usuario
    fileprivate func receiveBalance(){
        self.homeViewModel
            .reloadBalance
            .sink{ balance in
                self.money.text = String(balance)
                self.money.text = "$" + (self.money.text ?? "")
            }
            .store(in: &cancellables)
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(movementsList.count)
        return movementsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = ContenidoTableViewCell(transaction: movementsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/10
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let transaction = movementsList[indexPath.row]
        let vc = TransactionDetailsViewController(transaction: transaction)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}

