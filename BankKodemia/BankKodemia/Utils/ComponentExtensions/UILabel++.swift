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
        self.font = ConstantsFont.f14Normal
        self.adjustsFontSizeToFitWidth = true
        self.textColor = .white
    }
    func formatPurpleLink(){
        self.backgroundColor = .clear
        self.textColor = ConstantsUIColor.purpleLink
    }
    
    func formartGreenBlue(){
        self.backgroundColor = .clear
        self.font = ConstantsFont.f14Normal
        self.adjustsFontSizeToFitWidth = true
        self.textColor = ConstantsUIColor.greenBlue
    }
    
    func formartTitle(view: UIView, textTitle: String){
        self.textColor = .darkGray
        self.font = ConstantsFont.f20Bold
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
    
    func listDetails(view: UIView, previous: UIView, height: Float){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 0),
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: CGFloat(height))
        ])
    }
    
}
