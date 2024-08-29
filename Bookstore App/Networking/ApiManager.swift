//
//  ApiManager.swift
//  Bookstore App
//
//  Created by Анна on 21.08.2024.
//

import Foundation

final class ApiManager {
    private static let baseUrl = "https://openlibrary.org/"
    private static let path = "search.json"
    private static let requiredFields = "?fields=key,isbn,ratings_average,title,author_name,first_sentence,subject"
    
    static func getBooks(completion: @escaping(Result<[BooksResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + requiredFields + "&q=1&limit=10"
        
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
