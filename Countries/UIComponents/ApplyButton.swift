//
//  ApplyButton.swift
//  Countries
//
//  Created by Арсений Варицкий on 22.05.24.
//

import UIKit

class ApplyButton: UIView {

    private enum Constants {
        static var backgroundColor = { R.color.c055EBE() }
        static var poppinsBoldFont = { R.font.poppinsBold }
        static var white = { R.color.cFEFFFF() }
        static var shadowColor = { R.color.c008978() }
        static var applyText = { "Apply" }
        static var applyImage = { R.image.applyButton() }
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(resource: Constants.poppinsBoldFont(), size: 20)
        label.textColor = Constants.white()
        label.text = Constants.applyText()
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Constants.applyImage()
        return imageView
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
        layer.cornerRadius = 23
        layer.shadowColor = Constants.shadowColor()?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 10
        layer.masksToBounds = false

        addSubviews([backgroundImage, label])
    }
 
    private func setupConstraints() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
