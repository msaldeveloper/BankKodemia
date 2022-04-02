//
//  ContenidoTableViewCell.swift
//  AppLibrary-Challenge4
//
//  Created by Felipe Nery Guevara Guevara on 11/03/22.
//

import UIKit
import Combine

class ContenidoTableViewCell: UITableViewCell {

    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height
    
    var ownContent = UIView()
    
    var nameIssuer = UILabel()
    var date = UILabel()
    var amount = UILabel()
    
    var transaction = TransactionModel(id: "", amount: 0, type: "", concept: "", createdAt: "", issuer: User(_id: "", email: "", name: "", lastName: ""), destinationUser: User(_id: "", email: "", name: "", lastName: ""), isIncome: false)
    
    
    init(transaction : TransactionModel){
        
        super.init(style: .default, reuseIdentifier: nil)
        
        self.transaction = transaction
        
        self.backgroundColor = .clear
        
        initUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: heigth/10 - 10))
        ownContent.backgroundColor = .clear

        self.addSubview(ownContent)
        
        nameIssuer = UILabel(frame: CGRect(x: 20, y: 0, width: width-40, height: (heigth/7 - 10)/3))
        nameIssuer.text = transaction.issuer.name
        nameIssuer.textAlignment = .left
        nameIssuer.font = .boldSystemFont(ofSize: 18)
        
        ownContent.addSubview(nameIssuer)
        
        date = UILabel(frame: CGRect(x: 20, y: (heigth/7 - 10)/3, width: width-40, height: (heigth/7 - 10)/3))
        date.text = transaction.createdAt
        date.textAlignment = .left
        
        ownContent.addSubview(date)
        
    }
    
}
