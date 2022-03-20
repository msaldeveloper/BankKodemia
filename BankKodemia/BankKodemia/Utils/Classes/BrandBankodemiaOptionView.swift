//
//  BrandOptionView.swift
//  BankKodemia
//
//  Created by MacBook on 20/03/22.
//

import Foundation
import UIKit

class BrandBankodemiaOptionView : UIView{ // Se crea una clase que hereda de UIView
    
    var BrandBankodemia : UIImageView? // Atributo que es un UIImageView

    
    init(iconBrandBankodemia : String){
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        BrandBankodemia = UIImageView()
        BrandBankodemia?.backgroundColor = .white
        BrandBankodemia?.image = UIImage(named: iconBrandBankodemia)
        BrandBankodemia?.contentMode = .scaleAspectFit
        //BrandBankodemia?.addAnchorsAndSize(width: 40, height: 40, left: 10, top: 5, right: nil, bottom: nil)
        self.addSubview(BrandBankodemia!)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
