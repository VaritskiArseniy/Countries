//
//  EditVisitViewController.swift
//  Countries
//
//  Created by Арсений Варицкий on 4.05.24.
//

import UIKit

protocol EditViewControllerInterface: AnyObject {
    
}

protocol EditViewControllerDelegate: AnyObject {
    func setCountry(model: CountryModel)
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
        static var applyButoon = { R.image.applyButton() }
    }
    
    private var country: CountryModel?
    
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
    
    private var countryView = CountryView()
    
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
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var dayView: DateView = {
        let textField = DateView(type: .day)
        return textField
    }()
    
    private lazy var monthView: DateView = {
        let textField = DateView(type: .month)
        return textField
    }()
    
    private lazy var yearView: DateView = {
        let textField = DateView(type: .year)
        return textField
    }()
    
    private lazy var applyButton: ApplyButton = {
        let button = ApplyButton()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cencelButtonPressed))
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    init(viewModel: EditViewModel) {
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
        view.backgroundColor = Constants.backgroundColor()
        dateStackView.addArrangedSubviews([dayView, monthView, yearView])
        view.addSubviews([
            cencelButton,
            titleLabel,
            visitedButton,
            wantVisitButton,
            planetImageView,
            countryTitleLabel,
            countryView,
            dateImageView,
            dateTitleLabel,
            dateStackView,
            applyButton
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
            $0.size.equalTo(16)
        }
        
        dateTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(dateImageView)
            $0.leading.equalTo(dateImageView.snp.trailing).offset(14)
            $0.height.equalTo(30)
            $0.width.equalToSuperview().dividedBy(2)
        }
        
        dateStackView.snp.makeConstraints {
            $0.top.equalTo(dateTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(countryView)
            $0.height.equalTo(58)
        }
        
        yearView.snp.makeConstraints {
            $0.width.equalTo(105)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(dateStackView.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(66)
        }
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
        viewModel.showCountries(from: self, delegate: self)
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
}

extension EditViewController: EditViewControllerDelegate {
    func setCountry(model: CountryModel) {
        country = model
        setupCountryView()
    }
}

extension EditViewController: EditViewControllerInterface {
    
}
