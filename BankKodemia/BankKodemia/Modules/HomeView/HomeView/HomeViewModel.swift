//
//  HomeViewModel.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.
//

import Foundation
import Alamofire
import Combine

class HomeViewModel {
    
    static var token : HTTPHeaders = []
    
    public var dataTableView = PassthroughSubject<[[TransactionModel]],Never>()//declarando publisher
    public var reloadDataTableView = PassthroughSubject<Bool,Never>()//declarando publisher
    public var reloadBalance = PassthroughSubject<Double,Never>()
    public var reloadUserData = PassthroughSubject<UserModel,Never>()
    
    fileprivate var data: [[TransactionModel]] {
        didSet{
            dataTableView.send(data)
        }
    }
    
    fileprivate var reload: Bool {
        didSet{
            reloadDataTableView.send(reload)
        }
    }
    
    fileprivate var balance: Double {
        didSet{
            reloadBalance.send(balance)
        }
    }
    
    fileprivate var user: UserModel {
        didSet{
            reloadUserData.send(user)
        }
    }
    
    init() {
        self.data = []
        self.reload = false
        self.balance = 0
        self.user = UserModel(_id: "", email: "", name: "", lastName: "")
    }
    
    private func newData(data: [[TransactionModel]]){
        self.data = data
    }
    
    private func reloadData(){
        self.reload = true
    }
    
    private func reloadNewBalance(balance: Double){
        self.balance = balance
    }
    
    private func reloadNewUserData(user: UserModel){
        self.user = user
    }
    
    var cancellables: [AnyCancellable] = []
    let getUserRequest = GetUserRequest()
    
    func tokenReciver(token : String){
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer "+token,
            "Accept": "application/json"
        ]
        
        HomeViewModel.token = headers
        
    }
    
    func leadData(){
        
        getUserRequest.getUserProfile(HomeViewModel.token).sink{ fullData in
            self.carga(data: fullData.value)
        }.store(in: &cancellables)
        
    }
    
    private func carga(data: GetUserFullData?){
        var dates : [[TransactionModel]] = []
        var date : String = ""
        
        for item in data?.data.transactions ?? [] {
            let id = item._id
            let amount = item.amount
            let type = item.type
            let concept = item.concept
            let createdAt = item.created_at
            let issuer = item.issuer
            let destinationUser = item.destinationUser
            let isIncome = item.isIncome
            
            let transaction = TransactionModel(id: id, amount: amount, type: type, concept: concept, createdAt: createdAt, issuer: User(_id: issuer._id, email: issuer.email, name: issuer.name, lastName: issuer.lastName), destinationUser: User(_id: destinationUser?._id ?? "", email: destinationUser?.email ?? "", name: destinationUser?.name ?? "", lastName: destinationUser?.lastName ?? ""), isIncome: isIncome)
            
            let day = transaction.createdAt[..<(transaction.createdAt.firstIndex(of: "T") ?? transaction.createdAt.endIndex)]
            
            if day == date{
                dates[dates.count-1].insert(transaction,at:0)
            }else{
                date = String(day)
                dates.append([transaction])
            }
        }
        dates.reverse()
        
        let name = data?.data.user.name ?? ""
        let lastName = data?.data.user.lastName ?? ""
        let email = data?.data.user.email ?? ""
        let idMe = data?.data.user._id ?? ""
        
        self.reloadNewUserData(user: UserModel(_id: idMe, email: email, name: name, lastName: lastName))
        self.reloadNewBalance(balance: data?.data.balance ?? 0.0)
        self.newData(data: dates)
        self.reloadData()
    }
    
}
