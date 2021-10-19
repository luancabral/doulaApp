//
//  UIColor+Extensions.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit


extension UIColor{
    convenience init(red:Int, green:Int, blue:Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
    }
    
    
    static let doulaAppDetails = UIColor(red: 153, green: 204, blue: 153)
    static let doulaAppMain = UIColor(red: 213, green: 218, blue: 239)
}
