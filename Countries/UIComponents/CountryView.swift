//
//  CountryView.swift
//  Countries
//
//  Created by Арсений Варицкий on 6.05.24.
//

import Foundation
import UIKit

class CountryView: UIView {
    private enum Constants {
        static var poppinsFont = { R.font.poppinsMedium }
        static var white = { R.color.cFEFFFF() }
        static var backgroundColor = { R.color.c121D36() }
        static var borderColor = { R.color.c20315A() }
        static var arrowImage = { R.image.arrowImage() }
        static var black = { R.color.c000000() }
        static var countryNameText = { "Israel" }
        static var countryImage = { R.image.israelImage() }
    }
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.arrowImage()
        return imageView
    }()
    
    private lazy var countryIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(resource: Constants.poppinsFont(), size: 16)
        label.textColor = Constants.white()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = Constants.backgroundColor()
        layer.cornerRadius = 20
        layer.borderWidth = 1.4
        layer.borderColor = Constants.borderColor()?.cgColor
        layer.shadowColor = Constants.black()?.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        addSubviews([arrowImageView, countryIconImageView, nameLabel])
    }
 
    private func setupConstraints() {
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(16)
        }
        
        countryIconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
            $0.width.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(countryIconImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(22)
            $0.width.equalToSuperview().dividedBy(1.6)
        }
    }
    
    
    func configure(with model: CountryModel) {
        nameLabel.text = model.name
        countryIconImageView.image = model.icon
    }
}
