//
//  CoreDataHandleError.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import Foundation


public enum CoreDataHanleError{
    case notFoud
    case cantFetch
    case cantAdd
}


extension CoreDataHanleError:LocalizedError{
    
    public var errorDescription: String? {
        switch self {
            
        case .notFoud:
            return "Objeto não encontrado."
        case .cantFetch:
             return "Não foi possivel realizar a busca."
        case .cantAdd:
            return "Não foi possível adicionar o objeto."
        }
    }
}
