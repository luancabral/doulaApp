//
//  Mom+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 29/10/21.
//
//

import Foundation
import CoreData


extension Mom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mom> {
        return NSFetchRequest<Mom>(entityName: "Mom")
    }

    @NSManaged public var cpf: String?
    @NSManaged public var dpp: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var insurance: String?
    @NSManaged public var name: String?
    @NSManaged public var rg: String?
    @NSManaged public var state: String?
    @NSManaged public var adress: Adress?
    @NSManaged public var baby: Baby?
    @NSManaged public var doctor: Doctor?
    @NSManaged public var hospital: NSSet?
    @NSManaged public var people: Relative?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for hospital
extension Mom {

    @objc(addHospitalObject:)
    @NSManaged public func addToHospital(_ value: Hospital)

    @objc(removeHospitalObject:)
    @NSManaged public func removeFromHospital(_ value: Hospital)

    @objc(addHospital:)
    @NSManaged public func addToHospital(_ values: NSSet)

    @objc(removeHospital:)
    @NSManaged public func removeFromHospital(_ values: NSSet)

}

// MARK: Generated accessors for notes
extension Mom {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension Mom : Identifiable {

}
