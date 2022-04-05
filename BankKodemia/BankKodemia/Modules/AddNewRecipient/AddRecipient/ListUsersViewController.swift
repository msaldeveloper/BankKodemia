//
//  ListUsersViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 04/04/22.
//

import UIKit
import Combine

class ListUsersViewController: UIViewController {
    var backgroundColor = ConstantsUIColor.clearBackground
    var addRecipientViewModel = AddRecipientViewModel()
    var arrowButton: UIButton = UIButton()
    var logo : UIImageView = UIImageView()
    var initSessionLabel : UILabel = UILabel()
    var movementsList : [UserDataModel] = []
    private var cancellables: [AnyCancellable] = []
    lazy var movementsTable : UITableView = UITableView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        self.addRecipientViewModel.listUserDataRequest()
        initUI()
        reloadData()
        newData()
        
        movementsTable.delegate = self
        movementsTable.dataSource = self
    }
    func initUI(){
        logoComponent()
        backButtonComponent()
        titleLabel()
        newTable()
    }
    func logoComponent(){
        view.addSubview(logo)
        logo.logoFormart(view: view
        )
    }
    func backButtonComponent(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: Text.AddNewRecipient.BackButton , widthText: width/3)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    func titleLabel(){
        view.addSubview(initSessionLabel)
        initSessionLabel.formartTitle(view: view, textTitle: Text.AddNewRecipient.PageTitle)
    }
    func newTable(){
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
        self.addRecipientViewModel
            .dataTableView
            .sink{ newList in
                self.movementsList = newList
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para saber cuando recargar la data de la tableView
    fileprivate func reloadData(){
        self.addRecipientViewModel
            .reloadDataTableView
            .sink{ _ in
                DispatchQueue.main.async {
                    self.movementsTable.reloadData()
                }
            }
            .store(in: &cancellables)
    }

    
}
extension ListUsersViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}

//MARK: -EXTENSIONS TABLE VIEW

extension ListUsersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(movementsList.count)
        return movementsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = AddRecipientTableViewCell(userList: movementsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/10
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let transaction = movementsList[indexPath.row]
//        let vc = AddRecipientViewModel(transaction: transaction)
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//
//    }
    
}
