//
//  Category+CoreDataProperties.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/20/22.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var cateId: Int32
    @NSManaged public var cateName: String?
    @NSManaged public var truyens: NSSet?

}

// MARK: Generated accessors for truyens
extension Category {

    @objc(addTruyensObject:)
    @NSManaged public func addToTruyens(_ value: Truyen)

    @objc(removeTruyensObject:)
    @NSManaged public func removeFromTruyens(_ value: Truyen)

    @objc(addTruyens:)
    @NSManaged public func addToTruyens(_ values: NSSet)

    @objc(removeTruyens:)
    @NSManaged public func removeFromTruyens(_ values: NSSet)

}

extension Category : Identifiable {

}
