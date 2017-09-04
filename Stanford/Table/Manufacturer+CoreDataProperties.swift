//
//  Manufacturer+CoreDataProperties.swift
//  Table
//
//  Created by Sharad Paghadal on 13/03/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import Foundation
import CoreData


extension Manufacturer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manufacturer> {
        return NSFetchRequest<Manufacturer>(entityName: "Manufacturer");
    }

    @NSManaged public var name: String?
    @NSManaged public var have: NSSet?

}

// MARK: Generated accessors for have
extension Manufacturer {

    @objc(addHaveObject:)
    @NSManaged public func addToHave(_ value: Device)

    @objc(removeHaveObject:)
    @NSManaged public func removeFromHave(_ value: Device)

    @objc(addHave:)
    @NSManaged public func addToHave(_ values: NSSet)

    @objc(removeHave:)
    @NSManaged public func removeFromHave(_ values: NSSet)

}
