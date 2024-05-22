//
//  EditIO.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation
import UIKit


protocol EditOutput: AnyObject {
    func showCountries(from viewController: UIViewController, delegate: EditViewControllerDelegate)
}

protocol EditInput: AnyObject {
    
}
