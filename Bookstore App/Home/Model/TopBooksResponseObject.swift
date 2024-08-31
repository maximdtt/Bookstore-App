//
//  TopBooksResponseObject.swift
//  Bookstore App
//
//  Created by Анна on 31.08.2024.
//

import Foundation

struct TrendingObject: Codable {
    let query: String
    let works: [TopBooks]
    let days, hours: Int
}

struct TopBooks: Codable {
    let authorName: [String]
    let coverEditionKey: String?
    
    let key: String
    let title: String
    let ia: [String]?
    let iaCollectionS: String?
    let availability: Availability?


    enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case coverEditionKey
        case key
        case title, ia
        case iaCollectionS
        case availability
    }
}

// MARK: - Availability
struct Availability: Codable {
    let isbn: String?

    enum CodingKeys: String, CodingKey {
        case isbn
    }
}
