//
//  ConstantRegExp.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation
import CoreText

//Regular Expresions 
struct RegExp{
    static let Email: String = "^([a-z]|[A-Z])+(\\w|\\W)+@(([a-z]|[A-Z])+\\.([a-z]|[A-Z])+|([a-z]|[A-Z])+\\.([a-z]|[A-Z])+\\.([a-z]|[A-Z])+)$"
    static let Phone: String = #"^\(?\d{2}\)?[ -]?\d{4}[ -]?\d{4}$"#
    static let Password: String = "^(?=.{8,}$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$"
    
}
