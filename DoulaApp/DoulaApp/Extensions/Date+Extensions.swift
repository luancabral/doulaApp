//
//  Date+Extensions.swift
//  DoulaApp
//
//  Created by Luan Cabral on 03/11/21.
//

import Foundation


extension Date {
    
    public func toString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: self)
    }
    
    
}
