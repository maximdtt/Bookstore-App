//
//  UIView+Ex.swift
//  Bookstore App
//
//  Created by Анна on 13.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
