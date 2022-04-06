//
//  String++.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 06/04/22.
//

import Foundation

extension String{
    
    func moneyFormart() -> String{
        var wholNumber = ""
        var decimalNumber = ""
        
        wholNumber = String(self[self.startIndex...(self.index(before: self.firstIndex(of: ".") ?? self.endIndex))])
        
        decimalNumber = String(self[(self.index(after: self.firstIndex(of: ".") ?? self.endIndex))...index(before: self.endIndex)])
        
        while decimalNumber.count < 2{
            decimalNumber.insert("0", at: decimalNumber.endIndex)
        }
        
        decimalNumber = String(decimalNumber[decimalNumber.startIndex...decimalNumber.index(after: decimalNumber.startIndex)])
        
        var newFormart = ""
        var contador = 0
        for i in wholNumber.reversed(){
            contador += 1
            newFormart.insert(i, at: newFormart.startIndex)
            if contador%3 == 0 && wholNumber.count>contador{
                newFormart.insert(",", at: newFormart.startIndex)
            }
        }
        newFormart.insert("$", at: newFormart.startIndex)
        
        return newFormart + "." + decimalNumber
        
    }
    
}

