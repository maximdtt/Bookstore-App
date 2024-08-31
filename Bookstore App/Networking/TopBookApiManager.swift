//
//  TopBookApiManager.swift
//  Bookstore App
//
//  Created by Анна on 31.08.2024.
//

import Foundation

final class TopBookApiManager {
    private static let baseUrl = "https://openlibrary.org/"
    private static let path = "trending/"
    private static let requiredFields = "?fields=key,isbn,ratings_average,title,author_name,first_sentence,subject"
    
    enum Trending: String {
        case week = "weekly"
        case month = "monthly"
        case year = "yearly"
    }
    
    static func getBooks(trending: Trending, completion: @escaping(Result<[BooksResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path
        + trending.rawValue + ".json" + requiredFields + "&q=1&limit=10"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping(Result<[BooksResponseObject], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetWorkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(ResponseObject.self, from: data)
                completion(.success(model.docs))
            }
            catch let decodeError {
                print(decodeError)
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetWorkingError.unknown))
        }
    }
}


