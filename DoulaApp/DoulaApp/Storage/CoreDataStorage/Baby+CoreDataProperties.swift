//
//  Baby+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//
//

import Foundation
import CoreData


extension Baby {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Baby> {
        return NSFetchRequest<Baby>(entityName: "Baby")
    }

    @NSManaged public var name: String?
    @NSManaged public var christmasCard: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var mother: Mom?

}

extension Baby : Identifiable {

}
