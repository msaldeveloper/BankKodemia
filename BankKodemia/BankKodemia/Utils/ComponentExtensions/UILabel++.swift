//
//  UILabel++.swift
//  Bankodemia
//
//  Created by Felipe Nery Guevara Guevara on 14/03/22.
//

import Foundation
import UIKit

extension UILabel{
    func formartWhite(){
        self.backgroundColor = .clear
        self.font = .boldSystemFont(ofSize: 50)
        self.adjustsFontSizeToFitWidth = true
        self.textColor = .white
    }
    func formatPurpleLink(){
        self.backgroundColor = .clear
        self.textColor = ConstantsUIColor.purpleLink
    }
    
    func formartGreenBlue(){
        self.backgroundColor = .clear
        self.font = .boldSystemFont(ofSize: 50)
        self.adjustsFontSizeToFitWidth = true
        self.textColor = ConstantsUIColor.greenBlue
    }
    
    func formartTitle(view: UIView){
        
    }
    
}
