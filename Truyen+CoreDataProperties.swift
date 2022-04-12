//
//  Truyen+CoreDataProperties.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/20/22.
//
//

import Foundation
import CoreData


extension Truyen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Truyen> {
        return NSFetchRequest<Truyen>(entityName: "Truyen")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var img: String?
    @NSManaged public var cateId: Int32
    @NSManaged public var danhgia: Bool
    @NSManaged public var mota: String?
    @NSManaged public var category: Category?

}

extension Truyen : Identifiable {

}
