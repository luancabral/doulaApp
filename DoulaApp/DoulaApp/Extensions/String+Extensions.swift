//
//  String+Extensions.swift
//  DoulaApp
//
//  Created by Luan Cabral on 03/11/21.
//

import Foundation


extension String{
    
    public func toDate() -> Date?{
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: self) else{
            return nil
        }
        return date
    }
}
