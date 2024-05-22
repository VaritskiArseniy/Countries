//
//  MainViewController.swift
//  CountresPiсker
//
//  Created by Арсений Варицкий on 4.05.24.
//

import UIKit
import SnapKit

protocol MainViewControllerInterface: AnyObject {
}

class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel
                                                
    private enum Constants {
        static var buttonText = { "Open BottomSheet" }
    }
    
    private lazy var openSheetButton: UIButton = {
       let button = UIButton()
        button.setTitle(Constants.buttonText(), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(openSheetButton)
    }
    
    private func setupConstraints() {
        openSheetButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc
    private func buttonPressed() {
        viewModel.showEdit()
    }
}

extension MainViewController: MainViewControllerInterface {}

