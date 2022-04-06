//
//  SendMoneyViewModel.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 05/04/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import Combine

class SendMoneyViewModel{
    
    public var dataTableView = PassthroughSubject<[ContactModel],Never>()//declarando publisher
    public var reloadDataTableView = PassthroughSubject<Bool,Never>()//declarando publisher
    
    fileprivate var data: [ContactModel] {
        didSet{
            dataTableView.send(data)
        }
    }
    
    fileprivate var reload: Bool {
        didSet{
            reloadDataTableView.send(reload)
        }
    }
    
    init() {
        self.data = []
        self.reload = false
    }
    
    private func newData(data: [ContactModel]){
        self.data = data
    }
    
    private func reloadData(){
        self.reload = true
    }
    
    func selesctPosts(){
        
        var ref: DatabaseReference?
        
        ref = Database.database().reference()
        
        var contactList : [ContactModel] = []
        
        ref?.child("\(Auth.auth().currentUser?.uid ?? "")").observe(DataEventType.value) { (snapshot) in
            contactList.removeAll()
            for item in snapshot.children.allObjects as! [DataSnapshot] {
                let valores = item.value as? [String:AnyObject]
                let name = valores!["name"] as? String ?? ""
                let id = valores!["idAPI"] as? String ?? ""
                
                let contact = ContactModel(name: name, id: id)
                contactList.append(contact)
                self.newData(data: contactList)
            }
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
}
