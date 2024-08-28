//
//  CategoriesViewModel.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 28/08/2024.
//

import Foundation

final class CategoriesViewModel {
    
    // MARK: - Properties
    
    private var books: [BooksResponseObject] = []
    
    var subjects: [String] {
        return books.flatMap { $0.subject }
    }
    
    func fetchBooks(completion: @escaping (Result<Void, Error>) -> Void) {
        ApiManager.getBooks { [weak self] result in
            switch result {
            case .success(let booksResponse):
                self?.books = booksResponse
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
