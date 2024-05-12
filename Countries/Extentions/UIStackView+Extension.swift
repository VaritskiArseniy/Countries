//
//  UIStackView+Extension.swift
//  Countries
//
//  Created by Арсений Варицкий on 6.05.24.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
