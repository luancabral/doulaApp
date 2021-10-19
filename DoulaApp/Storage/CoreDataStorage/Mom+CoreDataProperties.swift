//
//  Mom+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//
//

import Foundation
import CoreData


extension Mom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mom> {
        return NSFetchRequest<Mom>(entityName: "Mom")
    }

    @NSManaged public var name: String?
    @NSManaged public var rg: String?
    @NSManaged public var cpf: String?
    @NSManaged public var adress: String?
    @NSManaged public var dpp: Date?
    @NSManaged public var insurance: String?
    @NSManaged public var id: UUID?
    @NSManaged public var people: NSSet?
    @NSManaged public var hospital: NSSet?
    @NSManaged public var baby: NSSet?
    @NSManaged public var doctor: Doctor?

}

// MARK: Generated accessors for people
extension Mom {

    @objc(addPeopleObject:)
    @NSManaged public func addToPeople(_ value: Relative)

    @objc(removePeopleObject:)
    @NSManaged public func removeFromPeople(_ value: Relative)

    @objc(addPeople:)
    @NSManaged public func addToPeople(_ values: NSSet)

    @objc(removePeople:)
    @NSManaged public func removeFromPeople(_ values: NSSet)

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

// MARK: Generated accessors for baby
extension Mom {

    @objc(addBabyObject:)
    @NSManaged public func addToBaby(_ value: Baby)

    @objc(removeBabyObject:)
    @NSManaged public func removeFromBaby(_ value: Baby)

    @objc(addBaby:)
    @NSManaged public func addToBaby(_ values: NSSet)

    @objc(removeBaby:)
    @NSManaged public func removeFromBaby(_ values: NSSet)

}

extension Mom : Identifiable {

}
