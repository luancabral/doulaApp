//
//  Doula+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 03/11/21.
//
//

import Foundation
import CoreData


extension Doula {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doula> {
        return NSFetchRequest<Doula>(entityName: "Doula")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}

extension Doula : Identifiable {

}
