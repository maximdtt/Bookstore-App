//
//  NetworkingError.swift
//  Bookstore App
//
//  Created by Анна on 21.08.2024.
//

import Foundation

enum NetWorkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
