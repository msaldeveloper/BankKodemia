//
//  SendMoneyViewController.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 24/03/22.
//

import UIKit

class SendMoneyViewController: UIViewController {
    
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    lazy var logo : UIImageView = UIImageView()
    lazy var backButton : UIButton = UIButton()
    lazy var titleView : UILabel = UILabel()
    lazy var addContact : UIImageView = UIImageView()
    lazy var contactsTable : UITableView = UITableView()
    lazy var buttonAddContact : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
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
        buttonAddContact.backgroundColor = .red
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
        
        contactsTable.backgroundColor = .systemGray5
        view.addSubview(contactsTable)
        contactsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: height/5),
            contactsTable.widthAnchor.constraint(equalToConstant: width),
            contactsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/5)
        ])
        
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
