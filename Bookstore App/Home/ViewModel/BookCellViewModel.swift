//
//  BookCellViewModel.swift
//  Bookstore App
//
//  Created by Анна on 20.08.2024.
//

import Foundation


struct BookCellViewModel {
    let title: String
    let authorName: String
    let subject: String
    let ratingsAverage: Double
    let firstSentence: String
    let image: URL?
    
    init(book: BooksResponseObject) {
        title = book.title
        authorName = book.authorName[0]
        subject = book.subject[0]
        ratingsAverage = book.ratingsAverage
        firstSentence = book.firstSentence?.first ?? ""
        image = book.getImage()
    }
}
