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
    
    lazy var backImage: UIButton = UIButton()
    
    var homeViewModel : HomeViewModel = HomeViewModel()
    var movementsList : [[TransactionModel]] = []
    
    private var cancellables: [AnyCancellable] = []
    
    static var userMe = UserModel(_id: "", email: "", name: "", lastName: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
        
        movementsTable.delegate = self
        movementsTable.dataSource = self
        
        receiveBalance()
        newData()
        reloadData()
        receiveUser()
        
        homeViewModel.leadData()
        
    }
    
    func initUI(){
        
        backImage.setImage(UIImage(named: "count"), for: .normal)
        backImage.addTarget(self, action:#selector(countImageAction) , for: .touchUpInside)
        view.addSubview(backImage)
        backImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3*ConstantsUIKit.width/36),
            backImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantsUIKit.height/100),
            backImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15),
            backImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15)
        ])

        
        view.addSubview(helpButton)
        helpButton.helpFormart(view: view)
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(moneyTitle)
        moneyTitle.formartTitle(view: view, textTitle: TextLocals.home_available_cash_top_message)
        
        money.textAlignment = .center
        money.font = ConstantsFont.f20SemiBold
        money.textColor = .black
        view.addSubview(money)
        money.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            money.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            money.topAnchor.constraint(equalTo: moneyTitle.bottomAnchor, constant: 3*height/120),
            money.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5)
        ])
        sendMoneyButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
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
        receivingMoneyButton.addTarget(self, action: #selector(goToDeposit), for: .touchUpInside)
        
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
                self.money.text = (self.money.text?.moneyFormart())
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para traer el balance del usuario
    fileprivate func receiveUser(){
        self.homeViewModel
            .reloadUserData
            .sink{ user in
                HomeViewController.userMe = user
            }
            .store(in: &cancellables)
    }
    
}
//MARK: - objc Actions
extension HomeViewController {
    @objc func sendButtonAction(){
        let sendMoneyViewController = SendMoneyViewController()
        sendMoneyViewController.modalPresentationStyle = .fullScreen
        present(sendMoneyViewController,animated: true,completion:{print("register button press validated")} )
    }
    @objc func countImageAction(){
        print("image tap")
        let profileViewController = ProfileViewController(user: HomeViewController.userMe)
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController,animated: true,completion:{print("register button press validated")} )
        
    }
        
    @objc func goToDeposit () {
        print("depositando")
        let depositViewController = DepositViewController()
        depositViewController.modalPresentationStyle = .fullScreen
        present(depositViewController, animated: true, completion: nil)
    }
}
//MARK: - table View
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movementsList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = ConstantsUIColor.greyBackGround
        // Aqui definimos el UIView el cual se va a retornar en la funcion
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: 8*width/9, height: 20))
        label.textColor = .black
        label.text = String(movementsList[section][0].createdAt[..<(movementsList[section][0].createdAt.firstIndex(of: "T") ?? movementsList[section][0].createdAt.endIndex)]).dateFormart()
        label.font = ConstantsFont.f14Normal
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movementsList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = movementsList[indexPath.section][indexPath.row]
        let cell : UITableViewCell = ContenidoTableViewCell(transaction: transaction, id: HomeViewController.userMe._id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/10
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let transaction = movementsList[indexPath.section][indexPath.row]
        let vc = TransactionDetailsViewController(transaction: transaction)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}

