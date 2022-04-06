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
    
    func dateFormart() -> String{
        
        let year = String(self[..<(self.firstIndex(of: "-") ?? self.endIndex)])
        let help = String(self[(self.index(after: self.firstIndex(of: "-") ?? self.endIndex))...index(before: self.endIndex)])
        var month = String(help[..<(help.firstIndex(of: "-") ?? help.endIndex)])
        let day = String(help[(help.index(after: help.firstIndex(of: "-") ?? help.endIndex))...index(before: help.endIndex)])
        
        switch month {
            case "01":
                month = "ENERO"
            case "02":
                month = "FEBRERO"
            case "03":
                month = "MARZO"
            case "04":
                month = "ABRIL"
            case "05":
                month = "MAYO"
            case "06":
                month = "JUNIO"
            case "07":
                month = "JULIO"
            case "08":
                month = "AGOSTO"
            case "09":
                month = "SEPTIEMBRE"
            case "10":
                month = "OCTUBRE"
            case "11":
                month = "NOVIEMBRE"
            case "12":
                month = "DICIEMBRE"
            
            default:
                month = ":("
        }
        
        return day + " " + month + " " + year
    }
    
}

