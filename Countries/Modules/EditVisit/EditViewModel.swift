//
//  EditViewModel.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation


protocol EditViewModelInterface {
    func showCountries()
}

class EditViewModel {
    
    weak var view: EditViewControllerInterface?
    private weak var output: EditOutput?    
    private let countryUseCase: CountryUseCase
    
    init(output: EditOutput? = nil, countryUseCase: CountryUseCase) {
        self.output = output
        self.countryUseCase = countryUseCase
    }
    
    func fetchDefault() -> CountryModel{
        countryUseCase.fetchDefaultCountry()
    }

}

extension EditViewModel: EditViewModelInterface {
    func showCountries() {
        output?.showCountries()
    }
}
