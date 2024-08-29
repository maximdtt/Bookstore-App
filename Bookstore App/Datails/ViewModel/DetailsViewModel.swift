//
//  DetailsViewModel.swift
//  Bookstore App
//
//  Created by Анна on 22.08.2024.
//

import Foundation

protocol DetailsViewModelProtocol {
    var title: String { get }
    var authorName: String { get }
    var subject: String { get }
    var ratingsAverage: Double { get }
    var firstSentence: String? { get }
    var image: URL? { get }
    
    func save()
    func delete()
    func getByKey() -> Bool
}

final class DetailsViewModel: DetailsViewModelProtocol {
    let title: String
    let authorName: String
    let subject: String
    let ratingsAverage: Double
    let firstSentence: String?
    let image: URL?
    let key: String
    
    init(book: BookCellViewModel) {
        title = book.title
        authorName = book.authorName
        subject = book.subject
        ratingsAverage = book.ratingsAverage
        firstSentence = book.firstSentence
        image = book.image
        key = book.key
    }
    
    func save() {
        let book = BooksLikesObject (title: title, authorName: authorName, subject: subject, image: image, key: key)
        
        BookPersistent.save(book)
    }
    
    func delete() {
        BookPersistent.delete(key)
    }
    
    func getByKey() -> Bool {
        BookPersistent.getByKey(key)
    }
}
