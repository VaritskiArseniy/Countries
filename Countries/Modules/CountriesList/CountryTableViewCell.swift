//
//  TableViewCell.swift
//  Countries
//
//  Created by Арсений Варицкий on 10.05.24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    private enum Constants {
        static var borderColor = { R.color.c283F63() }
        static var backgroundColor = { R.color.c3E659E() }
        static var black = { R.color.c000000() }
        static var white = { R.color.cFEFFFF() }
        static var poppinsFont = { R.font.poppinsMedium }
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.backgroundColor()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1.4
        view.layer.borderColor = Constants.borderColor()?.cgColor
        view.layer.shadowColor = Constants.black()?.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
        return view
    }()

    lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(resource: Constants.poppinsFont(), size: 16)
        label.textColor = Constants.white()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: CountryModel) {
        nameLabel.text = model.name
        flagImageView.image = model.icon
    }
    
    private func setup() {
        backgroundColor = .clear
        backView.addSubviews([flagImageView, nameLabel])
        contentView.addSubviews([backView])
        
        backView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(21)
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        flagImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.size.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(flagImageView.snp.trailing).offset(10)
            $0.height.equalTo(22)
            $0.width.equalToSuperview().dividedBy(0.8)
        }
    }

}
