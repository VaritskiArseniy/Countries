//
//  EditVisitViewController.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import UIKit

protocol EditViewControllerInterface: AnyObject {
    
}

class EditViewController: UIViewController {
    
    private let viewModel: EditViewModel
    
    private enum Constants {
        static var backgroundColor = { R.color.c1A304D() }
        static var cencelIcon = { R.image.cencelIcon() }
        static var white = { R.color.cFEFFFF() }
        static var titleText = { "Edit Visit" }
        static var visitedText = { "Visited" }
        static var unvisitedText = { "Want to Visit" }
        static var poppinsBoldFont = { R.font.poppinsBold }
        static var planetImage = { R.image.planetImage() }
        static var dateImage = { R.image.dateImage() }
        static var countryText = { "Country" }
        static var dateText = { "Date (Optional)" }
    }
    
    private var country: CountryModel?
    
    var didSelectCountry: ((CountryModel) -> Void)?
    
    private lazy var cencelButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.cencelIcon(), for: .normal)
        button.addTarget(self, action: #selector(cencelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText()
        label.font = UIFont(resource: Constants.poppinsBoldFont(), size: 24)
        label.textColor = Constants.white()
        return label
    }()
    
    private lazy var visitedButton: VisitButton = {
        let button = VisitButton()
        button.label.text = Constants.visitedText()
        button.isSelected = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(visitedButtonPressed))
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    private lazy var wantVisitButton: VisitButton = {
        let button = VisitButton()
        button.label.text = Constants.unvisitedText()
        button.isSelected = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(wantVisitButtonPressed))
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    private lazy var planetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.planetImage()
        return imageView
    }()
    
    private lazy var countryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.countryText()
        label.font = UIFont(resource: Constants.poppinsBoldFont(), size: 20)
        label.textColor = Constants.white()
        return label
    }()
    
    private lazy var countryView = CountryView()
    
    private lazy var dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.dateImage()
        return imageView
    }()
    
    private lazy var dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.dateText()
        label.font = UIFont(resource: Constants.poppinsBoldFont(), size: 20)
        label.textColor = Constants.white()
        return label
    }()
    
    
    init(viewModel: EditViewModel, country: CountryModel) {
        self.viewModel = viewModel
        self.country = country
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
        view.backgroundColor = Constants.backgroundColor()
        view.addSubviews([
            cencelButton,
            titleLabel,
            visitedButton,
            wantVisitButton,
            planetImageView,
            countryTitleLabel,
            countryView,
            dateImageView,
            dateTitleLabel
        ])
        setupCountryView()
    }
    
    private func setupConstraints() {
        cencelButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(16)
            $0.height.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalToSuperview().offset(19)
            $0.height.equalTo(34)
            $0.width.equalToSuperview().dividedBy(2)
        }
        
        visitedButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.height.equalTo(46)
            $0.width.equalTo(86)
        }
        
        wantVisitButton.snp.makeConstraints {
            $0.leading.equalTo(visitedButton.snp.trailing).offset(21)
            $0.top.equalTo(visitedButton)
            $0.height.equalTo(46)
            $0.width.equalTo(138)
        }
        
        planetImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalTo(visitedButton.snp.bottom).offset(37)
            $0.width.height.equalTo(16)
        }
        
        countryTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(planetImageView.snp.trailing).offset(14)
            $0.centerY.equalTo(planetImageView)
            $0.height.equalTo(30)
            $0.width.equalToSuperview().dividedBy(2)
        }
        
        countryView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(58)
            $0.top.equalTo(countryTitleLabel.snp.bottom).offset(20)
        }
        
        dateImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.top.equalTo(countryView.snp.bottom).offset(27)
            $0.width.height.equalTo(16)
        }
        
        dateTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(dateImageView)
            $0.leading.equalTo(dateImageView.snp.trailing).offset(14)
            $0.height.equalTo(30)
            $0.width.equalToSuperview().dividedBy(2)
        }
    }
    
    @objc
    private func cencelButtonPressed() {
        self.dismiss(animated: true)
    }
    
    @objc
    private func visitedButtonPressed() {
        visitedButton.isSelected = true
        wantVisitButton.isSelected = false
    }
    @objc
    private func wantVisitButtonPressed() {
        visitedButton.isSelected = false
        wantVisitButton.isSelected = true
    }
    
    private func setupCountryView() {
        if country != nil {
            countryView.configure(with: country!)
        } else {
            countryView.configure(with: viewModel.fetchDefault())
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(countryPressed))
        countryView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func countryPressed() {
        self.dismiss(animated: true)
        viewModel.showCountries()
    }
}

extension EditViewController: EditViewControllerInterface {
    
}
