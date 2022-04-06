//
//  ContenidoTableViewCell.swift
//  AppLibrary-Challenge4
//
//  Created by Felipe Nery Guevara Guevara on 11/03/22.
//

import UIKit

class AddRecipientTableViewCell: UITableViewCell {

    var width = UIScreen.main.bounds.width
    var heigth = UIScreen.main.bounds.height
    
    var ownContent = UIView()
    
    var nameIssuer = UILabel()
    var id = UILabel()
    
    var userList = UserDataModel(_id: "", email: "", name: "", lastName: "")
    
    
    init(userList : UserDataModel){
        
        super.init(style: .default, reuseIdentifier: nil)
        
        self.userList = userList
        
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
        nameIssuer.text = "\(userList.name) \(userList.lastName)"
        nameIssuer.textAlignment = .left
        nameIssuer.font = ConstantsFont.f14SemiBold
        
        ownContent.addSubview(nameIssuer)
        
        id = UILabel(frame: CGRect(x: 20, y: (heigth/7 - 10)/3, width: width-40, height: (heigth/7 - 10)/3))
        id.textColor = .black
        id.text = userList._id
        id.textAlignment = .left
        id.font = ConstantsFont.f14Regular
        ownContent.addSubview(id)
        
    }
    
}
