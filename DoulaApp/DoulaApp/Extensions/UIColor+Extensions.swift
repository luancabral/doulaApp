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
    static let doulaAppGray = UIColor(red: 245, green: 245, blue: 245)
    static let doulaTextField = UIColor(red: 0.980, green: 0.980, blue: 0.980, alpha: 1)
    static let doulaBlueL = UIColor(red: 216, green: 230, blue: 242)
    static let doulaBlueDark = UIColor(red: 41, green: 142, blue: 229)


}
