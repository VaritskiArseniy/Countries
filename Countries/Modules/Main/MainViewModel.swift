//
//  MainViewModel.swift
//  CountresPiсker
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation

protocol MainViewModelInterface {
    func showEdit()
}

class MainViewModel {
    
    weak var view: MainViewControllerInterface?
    private weak var output: MainOutput?
    
    
    init(output: MainOutput) {
        self.output = output
    }

}

extension MainViewModel: MainViewModelInterface {
    func showEdit() {
        output?.showEdit()
    }
    
    
}
