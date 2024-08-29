//
//  BookEntity+CoreDataProperties.swift
//  Bookstore App
//
//  Created by Анна on 26.08.2024.
//
//

import Foundation
import CoreData


extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var authorName: String?
    @NSManaged public var key: String?
    @NSManaged public var subject: String?
    @NSManaged public var image: URL?

}

extension BookEntity : Identifiable {

}
