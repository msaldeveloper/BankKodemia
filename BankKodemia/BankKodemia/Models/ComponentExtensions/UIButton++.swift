//
//  UIButton++.swift
//  Bankodemia
//
//  Created by Felipe Nery Guevara Guevara on 14/03/22.
//

import Foundation
import UIKit

extension UIButton{
    func formartBlueGreen(){
        self.backgroundColor = ConstantsUIColor.greenBlue
    }
    
    func formartClear(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.borderColor = ConstantsCGColor.greenBlue
    }
    
}
