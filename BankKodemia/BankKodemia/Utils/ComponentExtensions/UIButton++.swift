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
        self.layer.cornerRadius = 8
        self.backgroundColor = ConstantsUIColor.greenBlue
    }
    
    func formartClear(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = ConstantsCGColor.greenBlue
    }
    func formatTransparent(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = ConstantsCGColor.transparent
    }
    
    func addLabelWhite(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = .boldSystemFont(ofSize: 9*height/400)
        label.textColor = .white
        label.textAlignment = .center
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: 0),
            label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1)
        ])
    }
    
    func addLabelGreenblue(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = .boldSystemFont(ofSize: 9*height/400)
        label.textColor = ConstantsUIColor.greenBlue
        label.textAlignment = .center
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: 0),
            label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1)
        ])
    }
    
    func backButton(view: UIView, textDinamic: String, widthText: CGFloat){
        self.backgroundColor = .green
        let arrowImage = UIImageView(frame: CGRect(x: 0, y: ConstantsUIKit.height/320, width: 3*ConstantsUIKit.height/160, height: 3*ConstantsUIKit.height/160))
        arrowImage.backgroundColor = .red
        self.addSubview(arrowImage)
        let textButton = UILabel(frame: CGRect(x: 3*ConstantsUIKit.height/160 + ConstantsUIKit.width/36, y: -ConstantsUIKit.height/240, width: widthText, height: ConstantsUIKit.height/30))
        textButton.font = UIFont(name: "some", size: 7*ConstantsUIKit.height/400)
        textButton.text = textDinamic
        self.addSubview(textButton)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsUIKit.width/18),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/10),
            self.widthAnchor.constraint(equalToConstant: 3*ConstantsUIKit.height/160 + ConstantsUIKit.width/36 + widthText),
            self.heightAnchor.constraint(equalToConstant: ConstantsUIKit.height/40)
        ])
        
    }
    
}
