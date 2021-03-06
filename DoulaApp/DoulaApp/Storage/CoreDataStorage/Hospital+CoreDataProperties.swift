//
//  Hospital+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//
//

import Foundation
import CoreData


extension Hospital {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hospital> {
        return NSFetchRequest<Hospital>(entityName: "Hospital")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var id: UUID?
    @NSManaged public var mother: Mom?

}

extension Hospital : Identifiable {

}
