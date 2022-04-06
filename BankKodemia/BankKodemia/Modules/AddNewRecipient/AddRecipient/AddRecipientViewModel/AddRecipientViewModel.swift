//
//  AddRecipientViewModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 01/04/22.
//

import Foundation
import Combine
import Alamofire
import AVFoundation
import FirebaseDatabase
import FirebaseAuth

var listUserRequest = ListUserRequest()

class AddRecipientViewModel {
    var cancellables: [AnyCancellable] = []
    var list : [UserDataModel] = []
    var filtroPost : [UserDataModel] = []

    var getUserData = GetUserRequest()
    static var newToken = HTTPHeaders()
    
    var listUserDataRequestPublisher = PassthroughSubject<HTTPHeaders,Never>()
    
    
    public var dataTableView = PassthroughSubject<[UserDataModel],Never>()//declarando publisher
    public var dataTableViewFilter = PassthroughSubject<[UserDataModel],Never>()//declarando publisher
    public var reloadDataTableView = PassthroughSubject<Bool,Never>()//declarando publisher
    
    fileprivate var data: [UserDataModel] {
        didSet{
            dataTableView.send(data)
        }
    }
    
    fileprivate var dataFilter: [UserDataModel] {
        didSet{
            dataTableViewFilter.send(dataFilter)
        }
    }
    
    fileprivate var reload: Bool {
        didSet{
            reloadDataTableView.send(reload)
        }
    }
    
    private func newData(data: [UserDataModel]){
        self.data = data
    }
    
    private func newDataFilter(data: [UserDataModel]){
        self.dataFilter = data
    }
    
    private func reloadData(){
        self.reload = true
    }
    
    
    
    init() {
        self.data = []
        self.dataFilter = []
        self.reload = false
    }
    
    func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        print("token in token reciver",token)
        AddRecipientViewModel.newToken = headers

        
    }
    
    
    func listUserDataRequest(){
        listUserRequest.getUserData(AddRecipientViewModel.newToken)
            .sink{ fullData in
                self.carga(data: fullData.value)
            }.store(in: &cancellables)

    }
    
    private func carga(data: ListUsers?){
        for item in data?.data.users ?? [] {
            let id = item._id
            let lastName = item.lastName
            let name = item.name
            let email = item.email
                        
            let user = UserDataModel(_id: id, email: email, name: name, lastName: lastName)
            self.list.append(user)
        }
        
        self.newData(data: list)
        self.reloadData()
    }
    
    func filtroContenido(search: String){
        self.filtroPost = list.filter{ user in
            let username = user.name + " " + user.lastName
            return((username.lowercased().contains(search.lowercased())))
        }
        newDataFilter(data: filtroPost)
        reloadData()
    }
    
    func saveContact(name: String, id: String){
        
        var ref: DatabaseReference?
        ref = Database.database().reference()
        
        let campos = ["name": name, "idAPI": id, "idFirebase": Auth.auth().currentUser?.uid]
        ref?.child("\(Auth.auth().currentUser?.uid ?? "")").child(id).setValue(campos)
        
        print("Subimos:", campos)
        
    }
    
}
