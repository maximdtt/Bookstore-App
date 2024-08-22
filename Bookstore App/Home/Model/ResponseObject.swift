//
//  ResponseObject.swift
//  Bookstore App
//
//  Created by Анна on 20.08.2024.
//

import Foundation

struct ResponseObject: Codable {
    let start: Int
    let numFound: Int
    let docs: [BooksResponseObject]
    
    enum CodingKeys: String, CodingKey {
        case start
        case numFound = "num_found"
        case docs
    }
}
