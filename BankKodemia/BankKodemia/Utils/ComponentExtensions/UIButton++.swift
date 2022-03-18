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
    func backButton(_ textDinamic: String){
        self.backgroundColor = .clear
        let arrowImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 13, height: 10))
        arrowImage.backgroundColor = .red
        self.addSubview(arrowImage)
        let textButton = UILabel(frame: CGRect(x: 23, y: 0, width: 200, height: 21))
        textButton.font = UIFont(name: "some", size: 16)
        textButton.text = textDinamic
        self.addSubview(textButton)
        
    }
    
}
