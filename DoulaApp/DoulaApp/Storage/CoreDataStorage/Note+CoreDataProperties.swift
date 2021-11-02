//
//  Note+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 01/11/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var mom: Mom?

}

extension Note : Identifiable {

}
