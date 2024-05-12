//
//  SearchBar.swift
//  Countries
//
//  Created by Арсений Варицкий on 9.05.24.
//

import UIKit

class SearchView: UIView {

    private enum Constants {
        static var backgroundColor = { R.color.c121D36() }
        static var borderColor = { R.color.c20315A() }
        static var black = { R.color.c000000() }
        static var searchImage = { R.image.searchImage() }
        static var poppinsFont = { R.font.poppinsMedium }
        static var white = { R.color.cFEFFFF() }
    }

    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.searchImage()
        return imageView
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = Constants.white()
        textField.font = UIFont(resource: Constants.poppinsFont(), size: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Search country...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.clearButtonMode = .whileEditing
        return textField
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
        
        addSubviews([searchImageView, searchTextField])
    }
 
    private func setupConstraints() {

        searchImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
            $0.height.width.equalTo(24)
        }
        
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchImageView.snp.trailing).offset(16)
            $0.height.equalTo(22)
            $0.width.equalToSuperview().dividedBy(0.8)
        }
        
    }
}
