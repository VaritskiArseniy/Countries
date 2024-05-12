//
//  UIView+Extension.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
