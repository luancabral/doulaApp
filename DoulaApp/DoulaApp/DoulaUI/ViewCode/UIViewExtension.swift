//
//  UIViewExtension.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import Foundation
import UIKit

public extension UIView{
    func setRightConstraintWith(_ constraint:NSLayoutXAxisAnchor, whitConstantEqualTo constant:CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.rightAnchor.constraint(equalTo: constraint, constant: -constant).isActive = true
        }else{
            self.rightAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    func setLeftConstraint(_ constraint: NSLayoutXAxisAnchor, withConstantEqualTo constant:CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.leftAnchor.constraint(equalTo: constraint, constant: constant).isActive = true
        }else{
            self.leftAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    
    func setTopConstraintWith(_ constraint:NSLayoutYAxisAnchor, withConstantEqualTo constant:CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.topAnchor.constraint(equalTo: constraint, constant: constant).isActive = true
        }else{
            self.topAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    
    func setBottomConstraintWith(_ constraint:NSLayoutYAxisAnchor, withConstantEqualTo constant:CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints =  false
        if let constant = constant {
            self.bottomAnchor.constraint(equalTo: constraint, constant: -constant).isActive = true
        }else{
            self.bottomAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    func setCenterXWith(_ constraint:NSLayoutXAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: constraint).isActive = true
    }
    
    func setCenterYWith(_ constraint:NSLayoutYAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: constraint).isActive = true
    }
    
    func setDimeensionsConstraintWith(height:CGFloat? = nil, andWithWidth width:CGFloat? = nil){
        translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
       
        
    }
}
