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
    
    func formatPhantom(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.layer.borderColor = ConstantsCGColor.transparent
    }
    
    func formatGray(){
        self.backgroundColor = ConstantsUIColor.lightgreyKodemia
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.layer.borderColor = ConstantsCGColor.transparent
    }
    
    func addLabelWhite(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = ConstantsFont.f18SemiBold
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
    
    func addLabelDarkGray(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = ConstantsFont.f18SemiBold
        label.textColor = .darkGray
        label.textAlignment = .left
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: 0),
            label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1)
        ])
    }
    
    func addLabelDark(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = ConstantsFont.f18SemiBold
        label.textColor = .black
        label.textAlignment = .left
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: button.topAnchor, constant: 0),
            label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1),
            label.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1)
        ])
    }
    
    func addLabelUploader(button: UIButton, text: String){
        let label = UILabel()
        button.addSubview(label)
        label.font = ConstantsFont.f14SemiBold
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 2
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
        label.font = ConstantsFont.f18SemiBold
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
        let arrowImage = UIImageView(frame: CGRect(x: 0, y: ConstantsUIKit.height/320, width: 3*ConstantsUIKit.height/160, height: 3*ConstantsUIKit.height/160))
        arrowImage.image = UIImage(named: "backArrow")
        self.addSubview(arrowImage)
        let textButton = UILabel(frame: CGRect(x: 3*ConstantsUIKit.height/160 + ConstantsUIKit.width/36, y: -ConstantsUIKit.height/240, width: widthText, height: ConstantsUIKit.height/30))
        textButton.font = ConstantsFont.f14Normal
        textButton.text = textDinamic
        textButton.textColor = ConstantsUIColor.greyKodemia
        textButton.textAlignment = .center
        self.addSubview(textButton)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsUIKit.width/18),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height/16),
            self.widthAnchor.constraint(equalToConstant: 3*ConstantsUIKit.height/160 + ConstantsUIKit.width/36 + widthText),
            self.heightAnchor.constraint(equalToConstant: 9*ConstantsUIKit.height/350)
        ])
        
    }
    
}
