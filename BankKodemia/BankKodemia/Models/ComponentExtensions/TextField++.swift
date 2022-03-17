//
//  TextField++.swift
//  Bankodemia
//
//  Created by Mario Saldana on 14/03/22.
//

import Foundation
import UIKit

extension UITextField{
    func formatTextField(){
            self.textAlignment = .center
            self.backgroundColor = .clear
            self.layer.cornerRadius = 4
            self.layer.borderColor = ConstantsCGColor.greenBlue
            self.layer.borderWidth = 1
    }
}
