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
}

final class DetailsViewModel: DetailsViewModelProtocol {
    let title: String
    let authorName: String
    let subject: String
    let ratingsAverage: Double
    let firstSentence: String?
    let image: URL?
    
    init(book: BookCellViewModel) {
        title = book.title
        authorName = book.authorName
        subject = book.subject
        ratingsAverage = book.ratingsAverage
        firstSentence = book.firstSentence
        image = book.image
    }
}
