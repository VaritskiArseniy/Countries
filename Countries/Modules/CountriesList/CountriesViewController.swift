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
    
    private lazy var backgroundImageView: UIImageView = {
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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private lazy var searchView = SearchView()
    
    lazy var filteredData: [CountryModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.rowHeight = 58
        tableView.backgroundColor = .clear
        
        tableView.register(
            CountryTableViewCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier()
        )
        tableView.isScrollEnabled = false
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
        view.addSubviews([backgroundImageView, scrollView])
        scrollView.addSubviews([searchView, tableView])
        setupNavigationBar()
        endEditingSearchBar()
        searchView.searchTextField.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        searchView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(view.bounds.width - 42)
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(58)
        }
        
        tableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(view.bounds.width - 42)
            $0.top.equalTo(searchView.snp.bottom).offset(30)
            $0.height.equalTo(calculatedHeight())
            $0.bottom.lessThanOrEqualToSuperview().inset(20)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func endEditingSearchBar() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOutsiteKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
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
        print(searchText)
        print(filteredData)
        tableView.reloadData()
        tableView.snp.updateConstraints {
            $0.height.equalTo(calculatedHeight())
        }
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
    
    private func showEditViewController(for country: CountryModel) {
        let editViewModel = EditViewModel(countryUseCase: viewModel.countryUseCase)
        let editViewController = EditViewController(viewModel: editViewModel, country: country)
        
        let sheetPresentationController = editViewController.presentationController as? UISheetPresentationController
        
        sheetPresentationController?.preferredCornerRadius = 10
        sheetPresentationController?.detents = [.medium()]
        sheetPresentationController?.prefersGrabberVisible = false
        sheetPresentationController?.prefersScrollingExpandsWhenScrolledToEdge = false
        navigationController?.present(editViewController, animated: true)
    }
    
}

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexesToRedraw = [indexPath]
        tableView.reloadRows(at: indexesToRedraw, with: .fade)
        var selectedCountry: CountryModel
        if searchActive {
            selectedCountry = filteredData[indexPath.section]
        } else {
            selectedCountry = viewModel.fetchCountries()[indexPath.section]
        }
        showEditViewController(for: selectedCountry)
        navigationController?.popViewController(animated: true)
    }
}

extension CountriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard searchActive else { return viewModel.fetchCountries().count}
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier(), for: indexPath) as? CountryTableViewCell
        else { return UITableViewCell() }
        
        if searchActive {
            let country = filteredData[indexPath.section]
            cell.configure(with: country)
        } else {
            let country = viewModel.fetchCountries()[indexPath.section]
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
