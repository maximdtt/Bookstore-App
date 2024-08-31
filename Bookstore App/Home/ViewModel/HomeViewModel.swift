//
//  HomeViewModel.swift
//  Bookstore App
//
//  Created by Анна on 20.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol HomeViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }

    var numberOfCells: Int { get }
    
    func getBook(for row: Int) -> BookCellViewModel
    func saveForRecent(for row: Int)
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
    
    func saveForRecent(for row: Int) {
        if let user = Auth.auth().currentUser {
            let book = books[row]
            
            let ref = Database.database().reference().child("recent")
            
            ref.child(user.uid).updateChildValues([book.key: book.toDictionary()])
        }
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
