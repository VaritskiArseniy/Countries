//
//  CountriesViewController.swift
//  Countries
//
//  Created by Арсений Варицкий on 9.05.24.
//

import UIKit

protocol CountriesViewControllerInterface: AnyObject {
    
}

class CountriesViewController: UIViewController {
    
    private let viewModel: CountriesViewModel
    
    private enum Constants {
        static var backgroundImage = { R.image.backgroundImage() }
        static var cencelIcon = { R.image.cencelIcon() }
        static var cellIdentifier = { "cellIdentifier" }
    }
    
    var searchActive : Bool = false
    
    weak var editDelegate: EditViewControllerDelegate?
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.backgroundImage()
        return imageView
    }()
    
    private lazy var backgroundHeader: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.backgroundImage()
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.cencelIcon(), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var searchView = SearchView()
    
    var filteredData: [CountryModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.rowHeight = 68
        tableView.backgroundColor = .clear
        
        tableView.register(
            CountryTableViewCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier()
        )
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init(viewModel: CountriesViewModel) {
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
        view.addSubviews([backgroundImageView, backButton, searchView, tableView])
        endEditingSearchBar()
        searchView.searchTextField.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(21)
            $0.width.height.equalTo(40)
        }
        
        searchView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(1.1)
            $0.top.equalTo(backButton.snp.bottom).offset(34)
            $0.height.equalTo(58)
        }
        
        tableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(view.bounds.width)
            $0.top.equalTo(searchView.snp.bottom).offset(30)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func endEditingSearchBar() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOutsiteKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    private func calculatedHeight() -> Int {
        var count: Int
        
        if searchActive {
            count = filteredData.count
        } else {
            count = viewModel.fetchCountries().count
        }
        
        let height = 68 * count
        
        return height
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc
    private func tapOutsiteKeyboard() {
        searchView.searchTextField.resignFirstResponder()
    }
    
    @objc private func searchTextChanged(_ textField: UITextField) {
        let searchText = textField.text ?? ""
        filteredData = viewModel.filterCountries(searchText: searchText)
        if !searchText.isEmpty {
            searchActive = true
        } else {
            searchActive = false
            filteredData.removeAll()
        }
        tableView.reloadData()
    }
}

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexesToRedraw = [indexPath]
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
        var selectedCountry: CountryModel
        if searchActive {
            selectedCountry = filteredData[indexPath.row]
        } else {
            selectedCountry = viewModel.fetchCountries()[indexPath.row]
        }
        editDelegate?.setCountry(model: selectedCountry)
        
        dismiss(animated: true)
        
    }
}

extension CountriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard searchActive else { return viewModel.fetchCountries().count}
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier(), for: indexPath) as? CountryTableViewCell
        else { return UITableViewCell() }
        
        if searchActive {
            let country = filteredData[indexPath.row]
            cell.configure(with: country)
        } else {
            let country = viewModel.fetchCountries()[indexPath.row]
            cell.configure(with: country)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}

extension CountriesViewController: CountriesViewControllerInterface {
    
}
