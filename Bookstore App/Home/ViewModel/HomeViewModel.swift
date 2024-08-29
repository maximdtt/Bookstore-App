//
//  HomeViewModel.swift
//  Bookstore App
//
//  Created by Анна on 20.08.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }

    var numberOfCells: Int { get }
    
    func getBook(for row: Int) -> BookCellViewModel
}

final class HomeViewModel: HomeViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    //MARK: - Properties
    var numberOfCells: Int {
        books.count
    }
    private var books: [BooksResponseObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func getBook(for row: Int) -> BookCellViewModel {
        let book = books[row]
        return BookCellViewModel(book: book)
    }
    
    private func loadData() {
        //TODO: load Data
        ApiManager.getBooks { [weak self] result in
            switch result {
            case .success(let books):
                self?.books = books
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
}
