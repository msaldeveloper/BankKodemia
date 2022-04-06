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
    var userList : [UserDataModel] = []
    private var cancellables: [AnyCancellable] = []
    lazy var userTable : UITableView = UITableView()
    
    let searchContoller = UISearchController(searchResultsController: nil)
    
    var filterUsers : [UserDataModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        
        definesPresentationContext = true
        
        initUI()
        
        userTable.delegate = self
        userTable.dataSource = self
        searchContoller.searchResultsUpdater = self
        userTable.tableHeaderView = searchContoller.searchBar
        searchContoller.automaticallyShowsCancelButton = false
        
        self.addRecipientViewModel.listUserDataRequest()
        
        reloadData()
        newData()
        newDataFilter()
        
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
        userTable.backgroundColor = .white
        view.addSubview(userTable)
        userTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 3*height/16),
            userTable.widthAnchor.constraint(equalToConstant: width),
            userTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 13/16)
        ])
    }
    
    //suscriptor para traer la data del tablaView
    fileprivate func newData(){
        self.addRecipientViewModel
            .dataTableView
            .sink{ newList in
                self.userList = newList
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para traer la data del tablaView
    fileprivate func newDataFilter(){
        self.addRecipientViewModel
            .dataTableViewFilter
            .sink{ newList in
                self.filterUsers = newList
            }
            .store(in: &cancellables)
    }
    
    //suscriptor para saber cuando recargar la data de la tableView
    fileprivate func reloadData(){
        self.addRecipientViewModel
            .reloadDataTableView
            .sink{ _ in
                DispatchQueue.main.async {
                    self.userTable.reloadData()
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
        if filterUsers.isEmpty && searchContoller.searchBar.text == ""{
            return userList.count
        }else{
            return filterUsers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filterUsers.isEmpty && searchContoller.searchBar.text == ""{
            let cell : UITableViewCell = AddRecipientTableViewCell(userList: userList[indexPath.row])
            return cell
        }else{
            let cell : UITableViewCell = AddRecipientTableViewCell(userList: filterUsers[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height/10
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var nameSelect = ""
        var idSelect = ""
        if filterUsers.isEmpty && searchContoller.searchBar.text == ""{
            nameSelect = userList[indexPath.row].name + " " + userList[indexPath.row].lastName
            idSelect = userList[indexPath.row]._id
        }else{
            nameSelect = filterUsers[indexPath.row].name + " " + filterUsers[indexPath.row].lastName
            idSelect = filterUsers[indexPath.row]._id
        }
        let alerta = UIAlertController(title: "Agregar contacto", message: """
                                       ¿Deseas agregar a \(nameSelect)?
                                       Id: \(idSelect)
                                       """, preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default) { _ in
            self.addRecipientViewModel.saveContact(name: nameSelect, id: idSelect)
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(aceptar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)

    }
    
}


//MARK: -EXTENSIONS SEARCH
extension ListUsersViewController: UISearchResultsUpdating, UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        addRecipientViewModel.filtroContenido(search: self.searchContoller.searchBar.text ?? "")
    }
    
}
