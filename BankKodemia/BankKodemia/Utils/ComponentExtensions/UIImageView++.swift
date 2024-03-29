//
//  UIImageView++.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 20/03/22.
//

import Foundation
import UIKit

extension UIImageView{
    
    func logoFormart(view : UIView){
        self.image = UIImage(named: "logo")
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/9)
        ])
    }
    
    func logoFormartXL(view : UIView){
        self.image = UIImage(named: "logoXL")
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: (height/20)*3),
            self.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/5)
        ])
    }
    
    func logoImageXL(view : UIView){
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func arrowButtonIdentity(view : UIView){
        self.image = UIImage(named: "flecha-derecha")
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/33)
        ])
    }
    
    func countFormart(view: UIView){
        self.image = UIImage(named: "count")
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3*ConstantsUIKit.width/36),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantsUIKit.height/100),
            self.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15),
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15)
        ])
    }
    
    func helpFormart(view: UIView){
        self.image = UIImage(named: "help")
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3*ConstantsUIKit.width/36),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantsUIKit.height/100),
            self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15),
            self.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/15)
        ])
    }
    
}

//countButton = UIImageView(frame: CGRect(x: 3*width/40, y: height/16, width: width/15, height: width/15))
//countButton.image = UIImage(named: "count")

//logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
