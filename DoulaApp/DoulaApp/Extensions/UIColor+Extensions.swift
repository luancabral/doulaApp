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
//    static let doulaAppMain = UIColor(red: 124, green: 124, blue: 255)
    static let doulaAppMain = UIColor(red: 239, green: 241, blue: 248)
    static let doulaAppPurple = UIColor(red: 152, green: 151, blue: 237)
    static let doulaAppGray = UIColor(red: 245, green: 245, blue: 245)
    static let doulaTextField = UIColor(red: 0.980, green: 0.980, blue: 0.980, alpha: 1)
    static let doulaPink = UIColor(red: 211, green: 150, blue: 244)

}
