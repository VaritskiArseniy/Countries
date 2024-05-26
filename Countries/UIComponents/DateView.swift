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
        static var toolbar = { R.color.c20315A() }
        static var arrowDownImage = { R.image.arrowDownImage() }
        static var black = { R.color.c000000() }
        static var backgroundColorPicker = { R.color.c1A304D() }
    }
    
    private var type: TextFieldType
    
    private let days = Array(1...31)
    
    private var selectedRow: String?
    
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barTintColor = Constants.toolbar()
        toolbar.tintColor = Constants.white()
        toolbar.items = [cencelButton, flexSpace, doneButton]
        return toolbar
    }()
    
    private let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
    
    private let cencelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cencelAction))
    
    private let flexSpace = UIBarButtonItem(
        barButtonSystemItem: .flexibleSpace,
        target: nil,
        action: nil)
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.arrowDownImage()
        return imageView
    }()
    
    private lazy var datePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = Constants.backgroundColorPicker()
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
        
        toolbar.sizeToFit()
    }
    
    @objc
    private func doneAction() {
        if selectedRow?.isEmpty == false {
            dateTextField.text = selectedRow
        }
        dateTextField.resignFirstResponder()
    }
    
    @objc
    private func cencelAction() {
        dateTextField.resignFirstResponder()
    }
}


extension DateView: UITextFieldDelegate {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            return false
            toolbar.items = [flexSpace, doneButton]
            textField.inputAccessoryView = toolbar
            
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.inputView = datePickerView
        textField.inputAccessoryView = toolbar
    }
}


extension DateView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = type.array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type.array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = Constants.white()
        label.textAlignment = .center
        label.text = type.array[row]
        return label
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

