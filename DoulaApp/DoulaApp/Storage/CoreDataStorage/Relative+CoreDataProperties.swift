//
//  Relative+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 29/10/21.
//
//

import Foundation
import CoreData


extension Relative {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Relative> {
        return NSFetchRequest<Relative>(entityName: "Relative")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var kinship: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var mother: Mom?

}

extension Relative : Identifiable {

}
