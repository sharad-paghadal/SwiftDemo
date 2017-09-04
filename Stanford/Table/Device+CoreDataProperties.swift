//
//  Device+CoreDataProperties.swift
//  Table
//
//  Created by Sharad Paghadal on 13/03/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device");
    }

    @NSManaged public var modelName: String?
    @NSManaged public var belongsTo: Manufacturer?

}
