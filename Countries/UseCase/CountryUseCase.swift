//
//  CountryUseCase.swift
//  Countries
//
//  Created by Арсений Варицкий on 7.05.24.
//

import Foundation
import UIKit

protocol CountryUseCase {
    func fetchCountries() -> [CountryModel]
    func fetchDefaultCountry() -> CountryModel
}

class CountryUseCaseImplementation: CountryUseCase {
    
    private var countries = [CountryModel]()
    
    func countryFlag(countryCode: String) -> String {
      return String(String.UnicodeScalarView(
         countryCode.unicodeScalars.compactMap(
           { UnicodeScalar(127397 + $0.value) })))
    }
  
    init() {
        let locales = Locale.availableIdentifiers.compactMap { Locale(identifier: $0) }
        var uniqueCountryNames = Set<String>()
        
        for locale in locales {
            if let countryName = locale.localizedString(forRegionCode: locale.regionCode ?? "") {
                if !uniqueCountryNames.contains(countryName) {
                    let flag = countryFlag(countryCode: locale.regionCode ?? "")
                    let countryFlagImage = UIImage(emoji: flag, size: CGSize(width: 40, height: 24))
                    let countryModel = CountryModel(icon: countryFlagImage, name: countryName)
                    countries.append(countryModel)
                    uniqueCountryNames.insert(countryName)
                }
            }
        }
        countries.sort { $0.name < $1.name }
    }
    
    func fetchCountries() -> [CountryModel] {
        return countries
    }
    
    func fetchDefaultCountry() -> CountryModel {
        return .init(icon: R.image.israelImage(), name: "Israel")
    }
    

}
