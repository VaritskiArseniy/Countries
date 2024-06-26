//
//  Coordinator.swift
//  CountresPiсker
//
//  Created by Арсений Варицкий on 4.05.24.
//

import Foundation
import UIKit

final class Coordinator {
    
    private let assembly: Assembly
    private var navigationController = UINavigationController()
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func startMain(window: UIWindow) {
        let viewController = assembly.makeMain(output: self)
        navigationController = .init(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension Coordinator: MainOutput { 
    func showEdit() {
        let editView = assembly.makeEdit(output: self)
        
        let sheetPresentationController = editView.presentationController as? UISheetPresentationController
        
         let mediumId = UISheetPresentationController.Detent.Identifier("medium")
         
         let customMediumDetent = UISheetPresentationController.Detent.custom(identifier: mediumId) { context in
             return 560
         }
        
        sheetPresentationController?.preferredCornerRadius = 10
        sheetPresentationController?.detents = [customMediumDetent, .large()]
        sheetPresentationController?.prefersGrabberVisible = false
        sheetPresentationController?.prefersScrollingExpandsWhenScrolledToEdge = true
        
        navigationController.present(editView, animated: true, completion: nil)
    }
}

extension Coordinator: EditOutput {
    func showCountries(from viewController: UIViewController, delegate: EditViewControllerDelegate) {
        let countriesView = assembly.makeCountries(output: self, delegate: delegate)
        countriesView.modalPresentationStyle = .fullScreen
        viewController.present(countriesView, animated: true)
    }
    
}

extension Coordinator: CountriesOutput {}
