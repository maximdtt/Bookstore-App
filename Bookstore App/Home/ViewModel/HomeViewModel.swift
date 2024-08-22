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
        
//        setupMockObject()
    }
    
//    private func setupMockObject() {
//        books = [
//            BooksResponseObject(key: "...", title: "Harry Potter", authorName: "J.K. Rowling", subject: "fantasy", ratingsAverage: 3.5, firstSentence: "Mr and Mrs Dursley, of number four, Privet Drive, were proud to say that they were perfectly normal, thank you very much. They were the last people you’d expect to be involved in anything strange or mysterious, because they just didn’t hold with such nonsense.Mr Dursley was the director of a firm called Grunnings, which made drills. He was a big, beefy man with hardly any neck, although he did have a very large moustache. Mrs Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of her time craning over garden fences, spying on the neighbours. The Dursleys had a small son called Dudley and in their opinion there was no finer boy anywhere.", isbn: ["..."]),
//            BooksResponseObject(key: "...", title: "Властелин Колец", authorName: "Джон Рональд Руэл Толкин", subject: "fantasy", ratingsAverage: 3.2, firstSentence: "Именно это придает миру Средиземья специфическую достоверность. В этом Толкин принадлежит к целой тради­ции: он не один сшивает свою реаль­ность из кусочков нашей. К этой же традиции принадлежит Льюис Кэрролл, который создает волшебную страну на основе оксфордской реальности, английского языка, языковых игр. Или Клайв Льюис, который строит Нарнию из кусочков средневековой европейской литературы. Или Джордж Макдональд, который пишет свои сказки  на основе шотландского фольклора.", isbn: ["..."]),
//            BooksResponseObject(key: "...", title: "Война и Мир", authorName: "Лев Толстой", subject: "Роман", ratingsAverage: 5.0, firstSentence: "Ах, не говорите мне про Австрию! Я ничего не понимаю, может быть, но Австрия никогда не хотела и не хочет войны. Она предает нас. Россия одна должна быть спасительницей Европы. Наш благодетель знает свое высокое призвание и будет верен ему. Вот одно, во что я верю. Нашему доброму и чудному государю предстоит величайшая роль в мире, и он так добродетелен и хорош, что Бог не оставит его, и он исполнит свое призвание задавить гидру революции, которая теперь еще ужаснее в лице этого убийцы и злодея. Мы одни должны искупить кровь праведника. На кого нам надеяться, я вас спрашиваю?.. Англия с своим коммерческим духом не поймет и не может понять всю высоту души императора Александра. Она отказалась очистить Мальту. Она хочет видеть, ищет заднюю мысль наших действий. Что они сказали Новосильцеву? Ничего. Они не поняли, они не могли понять самоотвержения нашего императора, который ничего не хочет для себя и все хочет для блага мира. И что они обещали? Ничего. И что обещали, и того не будет! Пруссия уже объявила, что Бонапарте непобедим и что вся Европа ничего не может против него... ", isbn: ["..."])
//        ]
//    }
}
