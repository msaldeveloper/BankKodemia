//
//  ContenidoTableViewCell.swift
//  AppLibrary-Challenge4
//
//  Created by Felipe Nery Guevara Guevara on 11/03/22.
//

import UIKit

class ContenidoTableViewCell: UITableViewCell {

    var width = ConstantsUIKit.width
    var heigth = ConstantsUIKit.height
    
    lazy var ownContent = UIView()
    lazy var nameIssuer = UILabel()
    lazy var date = UILabel()
    lazy var amount = UILabel()
    
    
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
        nameIssuer.font = ConstantsFont.f14Normal
        
        ownContent.addSubview(nameIssuer)
        
        date = UILabel(frame: CGRect(x: 20, y: (heigth/7 - 10)/3, width: width/4, height: (heigth/7 - 10)/3))
        
        date.text = String(transaction.createdAt[(transaction.createdAt.index(after: transaction.createdAt.firstIndex(of: "T") ?? transaction.createdAt.endIndex) )...(transaction.createdAt.index(before: transaction.createdAt.firstIndex(of: ".") ?? transaction.createdAt.endIndex))])
        date.textAlignment = .left
        date.font = ConstantsFont.f14Regular
        
        ownContent.addSubview(date)
        
        amount = UILabel(frame: CGRect(x: 20+width/4, y: (heigth/7 - 10)/3, width: 3*width/4-40, height: (heigth/7 - 10)/3))
        var sign = ""
        if transaction.type == "PAYMENT"{
            sign = "+ $"
            amount.textColor = ConstantsUIColor.greenBlue
        }else{
            sign = "- $"
            amount.textColor = .red
            
        }
        amount.text = sign + String(transaction.amount)
        amount.font = ConstantsFont.f14Normal
        ownContent.addSubview(amount)
        
    }
    
}
