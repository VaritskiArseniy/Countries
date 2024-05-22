//
//  TextFieldType.swift
//  Countries
//
//  Created by Арсений Варицкий on 22.05.24.
//

import Foundation

enum TextFieldType {
    case day
    case month
    case year
    
    var array: [String] {
        switch self {
        case .day:
            return (1...31).map { "\($0)" }
            
        case .month:
            return ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
            
        case .year:
            return (1950...2050).map { "\($0)" }
        }
    }
}
