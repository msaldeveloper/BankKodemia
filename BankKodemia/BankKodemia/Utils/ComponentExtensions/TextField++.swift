//
//  TextField++.swift
//  Bankodemia
//
//  Created by Mario Saldana on 14/03/22.
//

import Foundation
import UIKit

extension UITextField{
    func formatTextField(_ inputText : String){
        self.textAlignment = .left
        self.autocapitalizationType = .none
        self.backgroundColor = .clear
        self.layer.cornerRadius = 4
        self.attributedPlaceholder = NSAttributedString(
            string: inputText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
    }
}
