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
}
