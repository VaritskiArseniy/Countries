//
//  EditViewModel.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation
import UIKit


protocol EditViewModelInterface {
    func showCountries(from viewController: UIViewController, delegate: EditViewControllerDelegate)
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
    func showCountries(from viewController: UIViewController, delegate: EditViewControllerDelegate) {
        output?.showCountries(from: viewController, delegate: delegate)
    }
}
