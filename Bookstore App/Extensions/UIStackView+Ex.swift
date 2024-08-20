//
//  UIStackView+Ex.swift
//  Bookstore App
//
//  Created by Анна on 14.08.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
