//
//  AddNewBeneficiaryView.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

class CustomButton: UIButton {
    override public var isHighlighted: Bool {
        didSet {
            self.backgroundColor = .clear
        }
    }
}
class AddNewBeneficiaryView: UIView {
    
   // let button = ContinueButtonView()
    
    let details = UILabel()
    
    let picker = UIPickerView()
    let pickerTextField = UITextField()
    let selectBank = ["Sbi", "HSBC", "Kotak"]
    let bankImg = UIButton(type: .custom)
    
    let accountNumber = UITextField()
    let confirmAccNumber = UITextField()
    let nickName = UITextField()
    let lebelData = UILabel()
    let beneficiaryName = UITextField()
   
    let pickerAccType = UIPickerView()
    let sltAccTypeTxt = UITextField()
    let selectAccType = ["Sbi", "HSBC", "Kotak"]
    let selectAccImg = UIButton(type: .custom)
    
    let stackView = UIStackView()
    let dividerView = UIView()
    let dividerView1 = UIView()
    let dividerView2 = UIView()
    let dividerView3 = UIView()
    let dividerView4 = UIView()
    let dividerView5 = UIView()

    let checkboxButton = UIButton(type: .custom)
    let checkLabel = UILabel()
    let checkIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accStyle()
        accLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bnkHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [pickerTextField, bankImg])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()

    lazy var bnkVStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bnkHStackView, dividerView4])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 1
        return view
    }()
    
    lazy var accountStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accountNumber,dividerView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    lazy var confirmAccStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [confirmAccNumber,dividerView1])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    lazy var nickNameStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nickName, dividerView2])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    lazy var bnfStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [beneficiaryName, dividerView3])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
    lazy var accTypeHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sltAccTypeTxt, selectAccImg])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()

    lazy var accTypeVStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accTypeHStackView, dividerView5])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 1
        return view
    }()
    
    lazy var checkBoxStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [checkboxButton, checkLabel, checkIcon])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 3
        return view
    }()
}

extension AddNewBeneficiaryView {
    func accStyle()
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        //enter details lebel
        details.translatesAutoresizingMaskIntoConstraints = false
        details.text = "Enter Details"
        details.textColor = .init(red: 0.18, green: 0.1, blue: 1, alpha: 1)
        details.font = .systemFont(ofSize: 20)
        
        //Select Bank dropDown Textfield
        pickerTextField.translatesAutoresizingMaskIntoConstraints = false
        pickerTextField.text = "Select Bank"
        pickerTextField.delegate = self
        picker.delegate = self
        picker.dataSource = self
        pickerTextField.inputView = picker
        pickerTextField.font = .systemFont(ofSize: 20)
        
        dividerView4.translatesAutoresizingMaskIntoConstraints = false
        dividerView4.backgroundColor = .secondarySystemFill
        
        bankImg.translatesAutoresizingMaskIntoConstraints = false
        bankImg.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        bankImg.tintColor = .black
        bankImg.sizeToFit()
        bankImg.addTarget(self, action: #selector(bankImgSelected(_:)), for: .touchUpInside)
        
        //Enter Acc Number TexField
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.placeholder = "Please enter Account Number"
        accountNumber.delegate = self
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        accountNumber.clearButtonMode = .whileEditing
        accountNumber.returnKeyType = .done
        accountNumber.font = .systemFont(ofSize: 20)
        
        
        //Enter Confirm Acc Number TexField
        confirmAccNumber.translatesAutoresizingMaskIntoConstraints = false
        confirmAccNumber.placeholder = "Please enter Confirm Account Number"
        confirmAccNumber.delegate = self
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.backgroundColor = .secondarySystemFill
        confirmAccNumber.font = .systemFont(ofSize: 20)
        confirmAccNumber.clearButtonMode = .whileEditing
        confirmAccNumber.returnKeyType = .done
        
        //Enter Nick Name texfield
        nickName.translatesAutoresizingMaskIntoConstraints = false
        nickName.placeholder = "Set a nickname"
        nickName.font = .systemFont(ofSize: 20)
        nickName.delegate = self
        nickName.clearButtonMode = .whileEditing
        nickName.returnKeyType = .done
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.backgroundColor = .secondarySystemFill
        
        //Text lebel
        lebelData.translatesAutoresizingMaskIntoConstraints = false
        lebelData.text = "Nickname help you recognise the beneficiary easily during selection. Nickname will not appear on your beneficiary's statement."
        lebelData.textColor = .darkGray
        lebelData.font = UIFont.systemFont(ofSize: 13)
        lebelData.numberOfLines = 0
        lebelData.preferredMaxLayoutWidth = 300
        lebelData.lineBreakMode = NSLineBreakMode.byWordWrapping
        lebelData.sizeToFit()
        
        //Enter Beneficiary Name TexField
        beneficiaryName.translatesAutoresizingMaskIntoConstraints = false
        beneficiaryName.placeholder = "Enter beneficiary name"
        beneficiaryName.font = .systemFont(ofSize: 20)
        beneficiaryName.delegate = self
        beneficiaryName.clearButtonMode = .whileEditing
        beneficiaryName.returnKeyType = .done
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.backgroundColor = .secondarySystemFill
        
        //Select Bank Type DropDown Textfield
        sltAccTypeTxt.translatesAutoresizingMaskIntoConstraints = false
        sltAccTypeTxt.translatesAutoresizingMaskIntoConstraints = false
        sltAccTypeTxt.text = "Select account type"
        sltAccTypeTxt.font = .systemFont(ofSize: 20)
        sltAccTypeTxt.delegate = self
        pickerAccType.delegate = self
        pickerAccType.dataSource = self
        sltAccTypeTxt.inputView = pickerAccType
        dividerView5.translatesAutoresizingMaskIntoConstraints = false
        dividerView5.backgroundColor = .secondarySystemFill
        
        selectAccImg.translatesAutoresizingMaskIntoConstraints = false
        selectAccImg.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        selectAccImg.tintColor = .black
        selectAccImg.addTarget(self, action: #selector(AccTypeSelected(_:)), for: .touchUpInside)
        
        
        //CheckBox Button
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
        checkboxButton.tintColor = .gray
        checkboxButton.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
        
        
        //Label for checkbox
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkLabel.text = "Tag as My Account"
        checkLabel.font = UIFont.systemFont(ofSize: 12)
        checkLabel.textColor = .darkGray
        
        //icon image for check box
        checkIcon.translatesAutoresizingMaskIntoConstraints = false
        checkIcon.image = UIImage(systemName: "info.circle.fill")
        checkIcon.sizeToFit()

        

    }
    
    
    @objc func checkboxTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        changeCheckboxImage()
    }
    
    @objc func bankImgSelected(_ sender: UIButton){
        sender.isSelected.toggle()
    }
    
    @objc func AccTypeSelected(_ sender: UIButton){
        sender.isSelected.toggle()
    }
    private func changeCheckboxImage() {
        if checkboxButton.isSelected {
            checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        else {
            checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }

//*Constraints*
    func accLayout()
    {
        
        addSubview(details)
        addSubview(bnkVStackView)
        addSubview(accountStackView)
        addSubview(confirmAccStackView)
        addSubview(nickNameStackView)
        addSubview(lebelData)
        addSubview(bnfStackView)
        addSubview(accTypeVStackView)
        addSubview(checkBoxStackView)
        
        //details Label
        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5),
            details.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: details.trailingAnchor, multiplier: 1),    
        ])
        //BankSelect DropDown field
        NSLayoutConstraint.activate([
            bnkHStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: bnkHStackView.trailingAnchor, multiplier: 2),
            bnkVStackView.topAnchor.constraint(equalToSystemSpacingBelow: details.bottomAnchor, multiplier: 5),
            bnkVStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: bnkVStackView.trailingAnchor, multiplier: 1)

        ])
        dividerView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //Account Number field
        NSLayoutConstraint.activate([
            accountStackView.topAnchor.constraint(equalToSystemSpacingBelow: bnkVStackView.bottomAnchor, multiplier: 12),
            accountStackView.leadingAnchor.constraint(equalTo: bnkVStackView.leadingAnchor),
            accountStackView.trailingAnchor.constraint(equalTo: bnkVStackView.trailingAnchor ),
          
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //Confirm Account Number field
        NSLayoutConstraint.activate([
            confirmAccStackView.topAnchor.constraint(equalToSystemSpacingBelow: accountStackView.bottomAnchor, multiplier: 3),
            confirmAccStackView.leadingAnchor.constraint(equalTo: accountStackView.leadingAnchor),
            confirmAccStackView.trailingAnchor.constraint(equalTo: accountStackView.trailingAnchor)
        ])
        dividerView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //NickName field
        NSLayoutConstraint.activate([
        
            nickNameStackView.topAnchor.constraint(equalToSystemSpacingBelow: confirmAccStackView.bottomAnchor, multiplier: 7),
            nickNameStackView.leadingAnchor.constraint(equalTo: confirmAccStackView.leadingAnchor),
            nickNameStackView.trailingAnchor.constraint(equalTo: confirmAccStackView.trailingAnchor)
    ])
        dividerView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //label data text
        NSLayoutConstraint.activate([
            lebelData.topAnchor.constraint(equalToSystemSpacingBelow: nickNameStackView.bottomAnchor, multiplier: 7),
            lebelData.leadingAnchor.constraint(equalTo: nickNameStackView.leadingAnchor),
            lebelData.trailingAnchor.constraint(equalTo: nickNameStackView.trailingAnchor)
        ])
        
        //Beneficiary Name field
        NSLayoutConstraint.activate([
            bnfStackView.topAnchor.constraint(equalToSystemSpacingBelow: lebelData.bottomAnchor, multiplier: 5),
            bnfStackView.leadingAnchor.constraint(equalTo: confirmAccStackView.leadingAnchor),
            bnfStackView.trailingAnchor.constraint(equalTo: confirmAccStackView.trailingAnchor)
        ])
        dividerView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //select Bank acc Type dropDown
        NSLayoutConstraint.activate([
            accTypeHStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: accTypeHStackView.trailingAnchor, multiplier: 2),
            accTypeVStackView.topAnchor.constraint(equalToSystemSpacingBelow: bnfStackView.bottomAnchor, multiplier: 6),
            accTypeVStackView.leadingAnchor.constraint(equalTo: confirmAccStackView.leadingAnchor),
            accTypeVStackView.trailingAnchor.constraint(equalTo: confirmAccStackView.trailingAnchor)
        ])
        dividerView5.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //checkBox button
        NSLayoutConstraint.activate([
            checkBoxStackView.topAnchor.constraint(equalToSystemSpacingBelow: accTypeVStackView.bottomAnchor, multiplier: 1),
            checkboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            checkLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: checkLabel.trailingAnchor, multiplier: 2),
            checkLabel.leadingAnchor.constraint(equalTo: checkboxButton.leadingAnchor,constant: 30),
        ])
        
    }
}

// TextFieldDelegate
extension AddNewBeneficiaryView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pickerTextField.endEditing(true)
        accountNumber.endEditing(true)
        confirmAccNumber.endEditing(true)
        nickName.endEditing(true)
        beneficiaryName.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            
            return true
        }
        else
        {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

//UIPickview Delegate and Datasource
extension AddNewBeneficiaryView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return selectBank.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectBank[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = selectBank[row]
    }
    
}

