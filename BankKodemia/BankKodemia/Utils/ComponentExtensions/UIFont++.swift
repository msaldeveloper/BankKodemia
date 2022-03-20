//
//  UIFont++.swift
//  BankKodemia
//
//  Created by MacBook on 19/03/22.
//

import Foundation
import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Poppins", size: size)
    }
}
