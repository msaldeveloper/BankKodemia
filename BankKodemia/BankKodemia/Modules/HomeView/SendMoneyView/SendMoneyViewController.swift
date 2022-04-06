//
//  SendMoneyViewController.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 24/03/22.
//

import UIKit
import Combine

class SendMoneyViewController: UIViewController {
    
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    lazy var logo : UIImageView = UIImageView()
    lazy var backButton : UIButton = UIButton()
    lazy var titleView : UILabel = UILabel()
    lazy var addContact : UIImageView = UIImageView()
    lazy var contactsTable : UITableView = UITableView()
    lazy var buttonAddContact : UIButton = UIButton()
    
    let sendMoneyViewModel : SendMoneyViewModel = SendMoneyViewModel()
    var contactsList : [ContactModel] = []
    
    private var cancellables: [AnyCancellable] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
        
        contactsTable.delegate = self
        contactsTable.dataSource = self
        
        newData()
        reloadData()
        
        sendMoneyViewModel.selesctPosts()
    }
    
    func initUI(){
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.tab_bar_init, widthText: width/7)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: TextLocals.send_cash_top_message)
        
        view.addSubview(buttonAddContact)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(addContactAction))
        buttonAddContact.addGestureRecognizer(gesture)
        buttonAddContact.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonAddContact.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            buttonAddContact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3*ConstantsUIKit.width/36),
            buttonAddContact.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15),
            buttonAddContact.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15)
        ])
        
        buttonAddContact.addSubview(addContact)
        addContact.image = UIImage(named: "userPlus")
        
        addContact.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addContact.centerYAnchor.constraint(equalTo: buttonAddContact.centerYAnchor),
            addContact.trailingAnchor.constraint(equalTo: buttonAddContact.trailingAnchor, constant: 0),
            addContact.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15),
            addContact.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15)
        ])
        
        contactsTable.backgroundColor = .white
        view.addSubview(contactsTable)
        contactsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: height/5),
            contactsTable.widthAnchor.constraint(equalToConstant: width),
            contactsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/5)
        ])
        
    }
    
    //suscriptor para traer la data del tablaView
    fileprivate func newData(){
        self.sendMoneyViewModel
            .dataTableView
            .sink{ newList in
                self.contactsList = newList
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para saber cuando recargar la data de la tableView
    fileprivate func reloadData(){
        self.sendMoneyViewModel
            .reloadDataTableView
            .sink{ _ in
                self.contactsTable.reloadData()
            }
            .store(in: &cancellables)
    }
    
}

//MARK: -EXTENSIONS TABLE VIEW

extension SendMoneyViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = SendMoneyTableViewCell(name: contactsList[indexPath.row].name, id: contactsList[indexPath.row].id)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ShipViewController(name: contactsList[indexPath.row].name, id: contactsList[indexPath.row].id)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}



// MARK: - OBJC Functions
extension SendMoneyViewController {
    @objc func addContactAction(){
        let vc = AddNewRecipientViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}
