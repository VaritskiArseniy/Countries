//
//  VisitButton.swift
//  Countries
//
//  Created by Арсений Варицкий on 5.05.24.
//

import UIKit

class VisitButton: UIView {
    
    private enum Constants {
        static var selectColor = { R.color.c055EBE() }
        static var unselectColor = { R.color.c1A304D() }
        static var poppinsBoldFont = { R.font.poppinsBold }
        static var white = { R.color.cFEFFFF() }
        static var shadowColor = { R.color.c1B67D9() }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(resource: Constants.poppinsBoldFont(), size: 16)
        label.textColor = Constants.white()
        return label
    }()
    
    var isSelected = true {
        didSet {
            backgroundColor = isSelected ? Constants.selectColor() : Constants.unselectColor()
            if isSelected {
                layer.shadowColor = Constants.shadowColor()?.cgColor
                layer.shadowOpacity = 0.5
                layer.shadowOffset = CGSize(width: 0, height: 10)
                layer.shadowRadius = 10
                layer.masksToBounds = false
            } else {
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }

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
        layer.borderWidth = 1.4
        layer.borderColor = Constants.selectColor()?.cgColor
        addSubview(label)
    }
 
    private func setupConstraints() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
