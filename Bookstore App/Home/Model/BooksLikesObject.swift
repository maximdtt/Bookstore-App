//
//  BooksLikesObject.swift
//  Bookstore App
//
//  Created by Анна on 28.08.2024.
//

import Foundation

struct BooksLikesObject {
    let title: String
    let authorName: String
    let subject: String
    let image: URL?
    let key: String
    
    init(title: String,
         authorName: String,
         subject: String,
         image: URL?,
         key: String) {
        self.title = title
        self.authorName = authorName
        self.subject = subject
        self.image = image
        self.key = key
    }
}
