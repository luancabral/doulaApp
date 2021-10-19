//
//  Doctor+CoreDataProperties.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//
//

import Foundation
import CoreData


extension Doctor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Doctor> {
        return NSFetchRequest<Doctor>(entityName: "Doctor")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var specialty: String?
    @NSManaged public var mom: NSSet?

}

// MARK: Generated accessors for mom
extension Doctor {

    @objc(addMomObject:)
    @NSManaged public func addToMom(_ value: Mom)

    @objc(removeMomObject:)
    @NSManaged public func removeFromMom(_ value: Mom)

    @objc(addMom:)
    @NSManaged public func addToMom(_ values: NSSet)

    @objc(removeMom:)
    @NSManaged public func removeFromMom(_ values: NSSet)

}

extension Doctor : Identifiable {

}
