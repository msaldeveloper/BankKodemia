//
//  UILabel++.swift
//  Bankodemia
//
//  Created by Felipe Nery Guevara Guevara on 14/03/22.
//

import Foundation
import UIKit

extension UILabel{
    func formatGreyText(){
            self.backgroundColor = .clear
            self.textColor = ConstantsUIColor.greyText
            self.textAlignment = .left
        }
    
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
    
    func formartTitle(view: UIView, textTitle: String){
            self.font = UIFont(name: "Poppins-Bold", size: ConstantsUIKit.height/32)
            self.text = textTitle
            self.textAlignment = .center
            self.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantsUIKit.height/10),
                self.heightAnchor.constraint(equalToConstant: ConstantsUIKit.height/24),
                self.widthAnchor.constraint(equalToConstant: ConstantsUIKit.width)
            ])
        }
    
}
