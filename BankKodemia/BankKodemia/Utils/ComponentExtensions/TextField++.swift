//
//  TextField++.swift
//  Bankodemia
//
//  Created by Mario Saldana on 14/03/22.
//

import Foundation
import UIKit

var greenBlue = UIColor(red: 0, green: 204/255, blue: 204/255, alpha: 0.9)

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
    
    func formatTextFieldGreenBlue(_ inputText : String){
        self.textAlignment = .left
        self.autocapitalizationType = .none
        self.backgroundColor = .clear
        self.layer.borderWidth = 4
        self.layer.borderColor = greenBlue.cgColor
        self.layer.cornerRadius = 4
        self.attributedPlaceholder = NSAttributedString(
            string: inputText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.7 )]
        )
    }
    
    func infoTextFielFormat(){
        
        self.formatTextField(" ")
        self.font = UIFont(name: "Poppins-Medium", size: 18)
        self.keyboardType = .emailAddress
        self.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
    }
}
