//
//  DateView.swift
//  Countries
//
//  Created by Арсений Варицкий on 21.05.24.
//

import UIKit

class DateView: UIView {
    
    private enum Constants {
        static var poppinsFont = { R.font.poppinsMedium }
        static var white = { R.color.cFEFFFF() }
        static var backgroundColor = { R.color.c121D36() }
        static var borderColor = { R.color.c20315A() }
        static var arrowDownImage = { R.image.arrowDownImage() }
        static var black = { R.color.c000000() }
    }
    
    private var type: TextFieldType
    
    private let days = Array(1...31)
    
    private var selectedDay: Int?
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.arrowDownImage()
        return imageView
    }()
    
    private lazy var datePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = Constants.backgroundColor()
        textField.textColor = Constants.white()
        textField.font = Constants.poppinsFont()(size: 16)
        textField.text = type.array[0]
        textField.delegate = self
        return textField
    }()
    
    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
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
        
        addSubviews([arrowImageView, dateTextField])
    }
    
    private func setupConstraints() {
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(16)
        }
        
        dateTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(22)
            $0.width.equalToSuperview().dividedBy(2)
        }
    }
}


extension DateView: UITextFieldDelegate {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            return false
            
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.inputView = datePickerView
        
    }
}


extension DateView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        dateTextField.text = type.array[row]
        
        self.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type.array[row]
    }
}

extension DateView: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

