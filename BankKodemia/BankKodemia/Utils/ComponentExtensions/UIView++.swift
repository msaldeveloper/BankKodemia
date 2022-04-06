//
//  UIView++.swift
//  BankKodemia
//
//  Created by Mario Saldana on 17/03/22.
//

import Foundation
import UIKit

extension UIView{
    func formatUIView(activate : Bool){
        if activate == true {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 4
            self.layer.borderColor = ConstantsCGColor.greenBlue
            self.layer.borderWidth = 1
        }else {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 4
            self.layer.borderColor = ConstantsCGColor.greyKodemia
            self.layer.borderWidth = 1
        }

    }
    
    func formatUIViewClear(activate : Bool){
        if activate == true {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 0
            self.layer.borderColor = ConstantsCGColor.transparent
            self.layer.borderWidth = 0
        }else {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 4
            self.layer.borderColor = ConstantsCGColor.greyKodemia
            self.layer.borderWidth = 1
        }

    }
    
    func formatUIViewDash(activate : Bool){
        
        if activate == true {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 0
            self.layer.borderColor = ConstantsCGColor.greenBlue
            self.layer.borderWidth = 1
            
        }else {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 4
            self.layer.borderColor = ConstantsCGColor.greyKodemia
            self.layer.borderWidth = 1
        }

    }
    
    func formatUIViewDate(activate : Bool){
        if activate == true {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 6
            self.layer.borderWidth = 0
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.1
            self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
            
            
        }else {
            self.backgroundColor = .clear
            self.layer.cornerRadius = 6
            self.layer.borderWidth = 0
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.1
            self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        }

    }
    
}
