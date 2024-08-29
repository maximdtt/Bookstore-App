//
//  LikesViewModel.swift
//  Bookstore App
//
//  Created by Анна on 27.08.2024.
//

import Foundation

protocol LikesViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var numberOfCells: Int { get }
    
    func getBook(for row: Int) -> BooksLikesObject
    func getBooks()
    func delete(key: String)
}

final class LikesViewModel: LikesViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    //MARK: - Properties
    var numberOfCells: Int {
        books.count
    }
    private var books: [BooksLikesObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    //MARK: - Initialization
    init() {
        loadData()
    }
    
    //MARK: - Methods
    func getBook(for row: Int) -> BooksLikesObject {
        return books[row]
    }
    
    func getBooks() {
        books = BookPersistent.fetchAll()
        print(books)
    }
    
    func delete(key: String) {
        BookPersistent.delete(key)
    }
    
    //MARK: - Private methods
    private func loadData() {
        //TODO: load Data
        books = BookPersistent.fetchAll()
    }
}
    

