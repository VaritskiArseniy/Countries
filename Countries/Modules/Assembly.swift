//
//  Assembly.swift
//  CountresPiсker
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation
import UIKit

final class Assembly {
    
    var countryUseCase: CountryUseCase {
        CountryUseCaseImplementation()
    }

    func makeMain(output: MainOutput) -> UIViewController {
        let viewModel = MainViewModel(output: output)
        let view = MainViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
    
    func makeEdit(output: EditOutput) -> UIViewController {
        let viewModel = EditViewModel(output: output, countryUseCase: countryUseCase)
        let view = EditViewController(viewModel: viewModel)
        viewModel.view = view
        return view
    }
    
    func makeCountries(output: CountriesOutput, delegate: EditViewControllerDelegate) -> UIViewController {
        let viewModel = CountriesViewModel(output: output, countryUseCase: countryUseCase)
        let view = CountriesViewController(viewModel: viewModel)
        view.editDelegate = delegate
        return view
    }
}

