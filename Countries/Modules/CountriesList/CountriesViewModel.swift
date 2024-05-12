//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Арсений Варицкий on 9.05.24.
//

import Foundation

protocol CountriesViewModelInterface {
}

class CountriesViewModel {
    
    weak var view: CountriesViewControllerInterface?
    private weak var output: CountriesOutput?
    
    let countryUseCase: CountryUseCase
    
    
    init(output: CountriesOutput, countryUseCase: CountryUseCase) {
        self.output = output
        self.countryUseCase = countryUseCase
    }
    
    func fetchCountries() -> [CountryModel] {
        return countryUseCase.fetchCountries()
    }
    
    func filterCountries(searchText: String) -> [CountryModel] {
        if searchText.isEmpty {
            return countryUseCase.fetchCountries()
        } else {
            return countryUseCase.fetchCountries().filter { country in
                return country.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
}

extension CountriesViewModel: CountriesViewModelInterface {
    
}
