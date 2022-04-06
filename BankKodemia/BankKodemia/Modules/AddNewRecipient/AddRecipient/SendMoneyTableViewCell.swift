//
//  SendMoneyTableViewCell.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 05/04/22.
//

import UIKit

class SendMoneyTableViewCell: UITableViewCell {

    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height
    
    var ownContent = UIView()
    
    var nameIssuer = UILabel()
    var id = UILabel()
    
    var nameText = ""
    var idText = ""
    
    
    init(name: String, id: String){
        
        super.init(style: .default, reuseIdentifier: nil)
        
        self.nameText = name
        self.idText = id
        
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
        nameIssuer.textColor = .black
        nameIssuer.text = nameText
        nameIssuer.textAlignment = .left
        nameIssuer.font = ConstantsFont.f14SemiBold
        
        ownContent.addSubview(nameIssuer)
        
        id = UILabel(frame: CGRect(x: 20, y: (heigth/7 - 10)/3, width: width-40, height: (heigth/7 - 10)/3))
        id.textColor = .black
        id.text = idText
        id.textAlignment = .left
        id.font = ConstantsFont.f14Regular
        ownContent.addSubview(id)
        
    }
    
}
