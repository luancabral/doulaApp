//
//  Adress+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 03/11/21.
//
//

import Foundation
import CoreData


extension Adress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Adress> {
        return NSFetchRequest<Adress>(entityName: "Adress")
    }

    @NSManaged public var cep: String?
    @NSManaged public var complement: String?
    @NSManaged public var district: String?
    @NSManaged public var id: UUID?
    @NSManaged public var number: String?
    @NSManaged public var reference: String?
    @NSManaged public var street: String?
    @NSManaged public var mom: Mom?

}

extension Adress : Identifiable {

}
