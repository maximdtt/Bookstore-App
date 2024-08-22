//
//  BooksResponseObject.swift
//  Bookstore App
//
//  Created by Анна on 20.08.2024.
//

import Foundation

struct BooksResponseObject: Codable {
    let key: String     //ключ
    let title: String     //название
    let authorName: [String]   //автор
    let subject: [String]    //категория
    let ratingsAverage: Double  //рейтинг
    let firstSentence: [String]?   //описание первого абзаца
    let isbn: [String]      //фото
    
    func getImage() -> URL? {
        if isbn.isEmpty {
            return nil
        }
        return URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn[0])-L.jpg")
    }
    
    enum CodingKeys: String, CodingKey {
        case key
        case title
        case authorName = "author_name"
        case subject
        case ratingsAverage = "ratings_average"
        case firstSentence = "first_sentence"
        case isbn 
    }
}
