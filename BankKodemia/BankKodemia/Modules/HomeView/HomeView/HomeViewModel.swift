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
    
    public var dataTableView = PassthroughSubject<[TransactionModel],Never>()//declarando publisher
    public var reloadDataTableView = PassthroughSubject<Bool,Never>()//declarando publisher
    public var reloadBalance = PassthroughSubject<Double,Never>()
    
    fileprivate var data: [TransactionModel] {
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
    
    init() {
        self.data = []
        self.reload = false
        self.balance = 0
    }
    
    private func newData(data: [TransactionModel]){
        self.data = data
    }
    
    private func reloadData(){
        self.reload = true
    }
    
    private func reloadNewBalance(balance: Double){
        self.balance = balance
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
            self.cargaPorFavor(data: fullData.value)
        }.store(in: &cancellables)
        
    }
    
    private func cargaPorFavor(data: GetUserFullData?){
        var list : [TransactionModel] = []
        print(data ?? "NO HAY NADA DE NUEVO :(")
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
            list.append(transaction)
        }
        self.reloadNewBalance(balance: data?.data.balance ?? 54)
        self.newData(data: list)
        self.reloadData()
    }
    
}
