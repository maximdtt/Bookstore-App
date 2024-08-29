//
//  BookPersistent.swift
//  Bookstore App
//
//  Created by Анна on 26.08.2024.
//

import CoreData
import Foundation


final class BookPersistent {
    private static let context = AppDelegate.persistentContainer.viewContext
    
    static func save(_ book: BooksLikesObject) {
        guard let description = NSEntityDescription.entity(forEntityName: "BookEntity", in: context) else { return }
        
        let entity = BookEntity(entity: description, insertInto: context)
        
        entity.key = book.key
        entity.title = book.title
        entity.authorName = book.authorName
        entity.subject = book.subject
        entity.image = book.image
        
        saveContext()
    }
    
    static func delete(_ key: String) {
        guard let entity = getEntity(key: key) else { return }
        context.delete(entity)
        saveContext()
    }
    
    static func fetchAll() -> [BooksLikesObject] {
        let request = BookEntity.fetchRequest()
        
        do {
            let objects = try context.fetch(request)
            return convert(entities: objects)
        } catch let error {
            debugPrint("Fetch not error: \(error)")
            return []
        }
    }
    
    static func getByKey(_ key: String) -> Bool {
        getEntity(key: key) != nil
    }
    
    //MARK: - Private methods
    private static func convert(entities: [BookEntity]) -> [BooksLikesObject] {
        let books = entities.map {
            BooksLikesObject(title: $0.title ?? "",
                             authorName: $0.authorName ?? "",
                             subject: $0.subject ?? "",
                             image: $0.image,
                             key: $0.key ?? "")
        }
        
        return books
    }
    
    private static func postNotification() {
        NotificationCenter.default.post(name: NSNotification.Name("Update"), object: nil)
    }
    
    private static func getEntity(key: String) -> BookEntity? {
        let request = BookEntity.fetchRequest()
        let predicate  = NSPredicate(format: "key = %@", key as NSString)
        
        request.predicate = predicate
        
        do {
            let objects = try context.fetch(request)
            return objects.first
        } catch let error {
            debugPrint("Fetch not error: \(error)")
            return nil
        }
    }
    
    private static func saveContext() {
        do {
            try context.save()
            postNotification()
        } catch let error {
            debugPrint("Save not error: \(error)")
        }
    }
}
