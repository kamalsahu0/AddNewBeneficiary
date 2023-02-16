//
//  AddNewBeneficiaryView.swift
//  AddNewBeneficiary
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

class AddNewBeneficiaryView: UIView {
    
    let details = UILabel()
    
    let bnkSltTextField = UITextField()
    let sltAccTypeTxt = UITextField()
    
    let bankSltBtn = UIButton(type: .custom)
    let selectAccTypeBtn = UIButton(type: .custom)
    
    let accountNumber = UITextField()
    
    let confirmAccNumber = UITextField()
    
    let nickName = UITextField()
    
    let lebelData = UILabel()
    
    let beneficiaryName = UITextField()
    
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
    
// MARK: - Select Bank horizontal stack
    lazy var bnkHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bnkSltTextField, bankSltBtn])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
// MARK: - Select Bank Vertical stack
    lazy var bnkVStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bnkHStackView, dividerView4])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 1
        return view
    }()
    
// MARK: - AccountStackView
    lazy var accountStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accountNumber,dividerView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
// MARK: - Confirm AccountStackView
    lazy var confirmAccStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [confirmAccNumber,dividerView1])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
// MARK: - nickName StackView
    lazy var nickNameStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nickName, dividerView2])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()

// MARK: - Beneficiary StackView
    lazy var bnfStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [beneficiaryName, dividerView3])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        return view
    }()
    
// MARK: - Select Account type Horizontal StackView
    lazy var accTypeHStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sltAccTypeTxt, selectAccTypeBtn])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
// MARK: - Select Account type Vertical StackView
    lazy var accTypeVStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accTypeHStackView, dividerView5])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 1
        return view
    }()
    
    // MARK: - CheckBox StackView
    lazy var checkBoxStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [checkboxButton, checkLabel, checkIcon])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 3
        return view
    }()
}

// MARK: - Extension AddNewBeneficiaryView
extension AddNewBeneficiaryView {
    func accStyle()
    {
        
        //enter details lebel
        details.translatesAutoresizingMaskIntoConstraints = false
        details.text = "Enter Details"
        details.textColor = .init(red: 0.18, green: 0.1, blue: 1, alpha: 1)
        details.font = .systemFont(ofSize: 20)
        
        //Select Bank dropDown Textfield
        bnkSltTextField.translatesAutoresizingMaskIntoConstraints = false
        bnkSltTextField.text = "Select Bank"
        bnkSltTextField.delegate = self
        bnkSltTextField.font = .systemFont(ofSize: 20)
        
        dividerView4.translatesAutoresizingMaskIntoConstraints = false
        dividerView4.backgroundColor = .secondarySystemFill
        
        bankSltBtn.translatesAutoresizingMaskIntoConstraints = false
        bankSltBtn.frame = CGRect(x: 0, y: 0, width: 200 , height: 100)
        bankSltBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        bankSltBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 26, bottom: 20, right: 26)
        bankSltBtn.tintColor = .black
        bankSltBtn.contentMode = .scaleAspectFit
        
        //Enter Acc Number TexField
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.placeholder = "Please enter Account Number"
        accountNumber.delegate = self
        accountNumber.clearButtonMode = .whileEditing
        accountNumber.font = .systemFont(ofSize: 20)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        //Enter Confirm Acc Number TexField
        confirmAccNumber.translatesAutoresizingMaskIntoConstraints = false
        confirmAccNumber.placeholder = "Please enter Confirm Account Number"
        confirmAccNumber.delegate = self
        confirmAccNumber.font = .systemFont(ofSize: 20)
        confirmAccNumber.clearButtonMode = .whileEditing
        
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.backgroundColor = .secondarySystemFill
        
        //Enter Nick Name texfield
        nickName.translatesAutoresizingMaskIntoConstraints = false
        nickName.placeholder = "Set a nickname"
        nickName.font = .systemFont(ofSize: 20)
        nickName.delegate = self
        nickName.clearButtonMode = .whileEditing
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
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.backgroundColor = .secondarySystemFill
        
        //Select Bank Type DropDown Textfield
        sltAccTypeTxt.translatesAutoresizingMaskIntoConstraints = false
        sltAccTypeTxt.translatesAutoresizingMaskIntoConstraints = false
        sltAccTypeTxt.text = "Select account type"
        sltAccTypeTxt.font = .systemFont(ofSize: 20)
        sltAccTypeTxt.delegate = self
        
        dividerView5.translatesAutoresizingMaskIntoConstraints = false
        dividerView5.backgroundColor = .secondarySystemFill
        
        selectAccTypeBtn.translatesAutoresizingMaskIntoConstraints = false
        selectAccTypeBtn.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
        selectAccTypeBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        selectAccTypeBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 26, bottom: 20, right: 26)
        selectAccTypeBtn.tintColor = .black
        selectAccTypeBtn.contentMode = .scaleAspectFit
    
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

    private func changeCheckboxImage() {
        if checkboxButton.isSelected {
            checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        else {
            checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
// MARK: - Constraints
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
            accTypeHStackView.leadingAnchor.constraint(equalTo: bnkHStackView.leadingAnchor),
            bnkHStackView.trailingAnchor.constraint(equalTo: accTypeHStackView.trailingAnchor, constant: -19),
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

// MARK: - Extension AddNewBeneficiaryView TextField Delegate
extension AddNewBeneficiaryView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        bnkSltTextField.endEditing(true)
//        accountNumber.endEditing(true)
//        confirmAccNumber.endEditing(true)
//        nickName.endEditing(true)
//        beneficiaryName.endEditing(true)
        return true
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != "" {
//
//            return true
//        }
//        else
//        {
//            return false
//        }
//
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
