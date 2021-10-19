//
//  ViewCodable.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import Foundation


public protocol ViewCodable {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}


public extension ViewCodable{
    func setupViews(){
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() {}
}
