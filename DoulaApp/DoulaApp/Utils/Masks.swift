//
//  Masks.swift
//  DoulaApp
//
//  Created by Luan Cabral on 03/11/21.
//

import Foundation


public enum Masks{
    case cpf
    case rg
    case cep
    case phone
}



extension Masks{
    
    
    public var maskFormat:String?{
        
        switch self {
        case .cpf:
            return "XXX.XXX.XXX-XX"
        case .rg:
            return "X.XXX.XXX"
        case .cep:
            return "XXXXX-XXX"
        case .phone:
            return "(XX)XXXXX-XXXX"
        }
        
    }
}
