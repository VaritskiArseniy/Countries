//
//  String+Extension.swift
//  Countries
//
//  Created by Арсений Варицкий on 11.05.24.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(emoji: String, size: CGSize) {
        let nsString = emoji as NSString
        let font = UIFont.systemFont(ofSize: size.height)
        let attributes = [NSAttributedString.Key.font: font]
        let rect = nsString.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        UIColor.clear.set()
        UIRectFill(CGRect(origin: .zero, size: rect.size))
        nsString.draw(at: .zero, withAttributes: attributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
