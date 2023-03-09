//
//  AddNewBeneficiaryView.swift
//  AddNewBeneficiary
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

class AddNewBeneficiaryView: UIView {
    
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
        let view = UIStackView(arrangedSubviews: [bnkSltTextLabel, bankSltBtn])
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
        let view = UIStackView(arrangedSubviews: [sltAccTypeTextLabel, selectAccTypeBtn])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 1
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
        return view
    }()
    
    // MARK: - Select ifsc code Vertical StackView
    lazy var ifscStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [ifsclabel, ifscCode, dividerLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
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
        
        //Select Bank dropDown lebel
        bnkSltTextLabel.translatesAutoresizingMaskIntoConstraints = false
        bnkSltTextLabel.text = "Select Bank"
        bnkSltTextLabel.font = .systemFont(ofSize: 20)
        
        dividerView4.translatesAutoresizingMaskIntoConstraints = false
        dividerView4.backgroundColor = .secondarySystemFill
        
        bankSltBtn.translatesAutoresizingMaskIntoConstraints = false
        bankSltBtn.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
        bankSltBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        bankSltBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 26, bottom: 20, right: 26)
        bankSltBtn.tintColor = .black
        
        //ifsc code lebel
        ifsclabel.translatesAutoresizingMaskIntoConstraints = false
        ifsclabel.font = .systemFont(ofSize: 15)
        ifsclabel.textColor = .gray
        
        ifscCode.translatesAutoresizingMaskIntoConstraints = false
        ifscCode.font = .systemFont(ofSize: 20)
        
        dividerLabel.translatesAutoresizingMaskIntoConstraints = false
        //Enter Acc Number TexField
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.placeholder = "Please enter Account Number"
        accountNumber.delegate = self
        accountNumber.autocorrectionType = .no
        accountNumber.autocapitalizationType = .none
        accountNumber.isSecureTextEntry = true
        accountNumber.font = .systemFont(ofSize: 20)
        accountNumber.delegate = self
        
        accountNumberError.translatesAutoresizingMaskIntoConstraints = false
        accountNumberError.font = .systemFont(ofSize: 14)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        //Enter Confirm Acc Number TexField
        confirmAccNumber.translatesAutoresizingMaskIntoConstraints = false
        confirmAccNumber.placeholder = "Please enter Confirm Account Number"
        confirmAccNumber.delegate = self
        confirmAccNumber.autocorrectionType = .no
        confirmAccNumber.autocapitalizationType = .none
        confirmAccNumber.font = .systemFont(ofSize: 20)
        //        confirmAccNumber.clearButtonMode = .whileEditing
        confirmAccNumberError.translatesAutoresizingMaskIntoConstraints = false
        confirmAccNumberError.font = .systemFont(ofSize: 14)
        
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.backgroundColor = .secondarySystemFill
        
        //Enter Nick Name texfield
        nickName.translatesAutoresizingMaskIntoConstraints = false
        nickName.placeholder = "Set a nickname"
        nickName.font = .systemFont(ofSize: 20)
        nickName.delegate = self
        nickName.autocorrectionType = .no
        nickName.autocapitalizationType = .none
        setNickNameError.translatesAutoresizingMaskIntoConstraints = false
        setNickNameError.font = .systemFont(ofSize: 14)
        
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.backgroundColor = .secondarySystemFill
        
        //Text lebel
        lebelData.translatesAutoresizingMaskIntoConstraints = false
        lebelData.text = "Nickname help you recognise the beneficiary easily during selection. Nickname will not appear on your beneficiary's statement."
        lebelData.textColor = .darkGray
        lebelData.font = UIFont.systemFont(ofSize: 13)
        lebelData.numberOfLines = 3
        
        //lebelData.preferredMaxLayoutWidth = 300
        //lebelData.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        //Enter Beneficiary Name TexField
        beneficiaryName.translatesAutoresizingMaskIntoConstraints = false
        beneficiaryName.placeholder = "Enter beneficiary name"
        beneficiaryName.font = .systemFont(ofSize: 20)
        beneficiaryName.delegate = self
        beneficiaryName.autocorrectionType = .no
        beneficiaryName.autocapitalizationType = .none
        //        beneficiaryName.clearButtonMode = .whileEditing
        benfNameError.translatesAutoresizingMaskIntoConstraints = false
        benfNameError.font = .systemFont(ofSize: 14)
        
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.backgroundColor = .secondarySystemFill
        
        //Select Bank Type DropDown lebel
        sltAccTypeTextLabel.translatesAutoresizingMaskIntoConstraints = false
        sltAccTypeTextLabel.text = "Select account type"
        sltAccTypeTextLabel.font = .systemFont(ofSize: 20)
        
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
        checkboxButton.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
        checkboxButton.imageEdgeInsets = UIEdgeInsets(top: 28, left: 40, bottom: 28, right: 40)
        checkboxButton.tintColor = .lightGray
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
        addSubview(ifscStackView)
        addSubview(accountStackView)
        addSubview(accountNumberError)
        addSubview(confirmAccStackView)
        addSubview(confirmAccNumberError)
        addSubview(nickNameStackView)
        addSubview(setNickNameError)
        addSubview(lebelData)
        addSubview(bnfStackView)
        addSubview(benfNameError)
        addSubview(accTypeVStackView)
        addSubview(checkBoxStackView)
        
        //details Label
        NSLayoutConstraint.activate([
            details.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
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
        
        //Ifsc code field
        NSLayoutConstraint.activate([
            ifscStackView.topAnchor.constraint(equalToSystemSpacingBelow: bnkVStackView.bottomAnchor, multiplier: 4),
            ifscStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: ifscStackView.trailingAnchor, multiplier: 1)
            
        ])
        dividerLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //Account Number field
        NSLayoutConstraint.activate([
            accountStackView.topAnchor.constraint(equalToSystemSpacingBelow: ifscStackView.bottomAnchor, multiplier: 5),
            accountStackView.leadingAnchor.constraint(equalTo: bnkVStackView.leadingAnchor),
            accountStackView.trailingAnchor.constraint(equalTo: bnkVStackView.trailingAnchor ),
            
            
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Account error Message
        NSLayoutConstraint.activate([
            accountNumberError.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 0.5),
            accountNumberError.leadingAnchor.constraint(equalTo: dividerView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: accountNumberError.trailingAnchor)
        ])
        
        //Confirm Account Number field
        NSLayoutConstraint.activate([
            confirmAccStackView.topAnchor.constraint(equalToSystemSpacingBelow: accountStackView.bottomAnchor, multiplier: 3),
            confirmAccStackView.leadingAnchor.constraint(equalTo: accountStackView.leadingAnchor),
            confirmAccStackView.trailingAnchor.constraint(equalTo: accountStackView.trailingAnchor)
        ])
        dividerView1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Confirm Account error Message
        NSLayoutConstraint.activate([
            confirmAccNumberError.topAnchor.constraint(equalToSystemSpacingBelow: dividerView1.bottomAnchor, multiplier: 0.5),
            confirmAccNumberError.leadingAnchor.constraint(equalTo: dividerView1.leadingAnchor),
            dividerView1.trailingAnchor.constraint(equalTo: confirmAccNumberError.trailingAnchor)
        ])
        
        //NickName field
        NSLayoutConstraint.activate([
            nickNameStackView.topAnchor.constraint(equalToSystemSpacingBelow: confirmAccStackView.bottomAnchor, multiplier: 7),
            nickNameStackView.leadingAnchor.constraint(equalTo: confirmAccStackView.leadingAnchor),
            nickNameStackView.trailingAnchor.constraint(equalTo: confirmAccStackView.trailingAnchor)
        ])
        dividerView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // setNick Name error Message
        NSLayoutConstraint.activate([
            setNickNameError.topAnchor.constraint(equalToSystemSpacingBelow: dividerView2.bottomAnchor, multiplier: 0.5),
            setNickNameError.leadingAnchor.constraint(equalTo: dividerView2.leadingAnchor),
            dividerView2.trailingAnchor.constraint(equalTo: setNickNameError.trailingAnchor)
        ])
        
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
        
        // BenfName error Message
        NSLayoutConstraint.activate([
            benfNameError.topAnchor.constraint(equalToSystemSpacingBelow: dividerView3.bottomAnchor, multiplier: 0.5),
            benfNameError.leadingAnchor.constraint(equalTo: dividerView3.leadingAnchor),
            dividerView3.trailingAnchor.constraint(equalTo: benfNameError.trailingAnchor)
        ])
        
        //select Bank acc Type dropDown
        NSLayoutConstraint.activate([
            accTypeHStackView.leadingAnchor.constraint(equalTo: bnkHStackView.leadingAnchor),
            bnkHStackView.trailingAnchor.constraint(equalTo: accTypeHStackView.trailingAnchor),
            accTypeVStackView.topAnchor.constraint(equalToSystemSpacingBelow: bnfStackView.bottomAnchor, multiplier: 6),
            accTypeVStackView.leadingAnchor.constraint(equalTo: confirmAccStackView.leadingAnchor),
            accTypeVStackView.trailingAnchor.constraint(equalTo: confirmAccStackView.trailingAnchor)
        ])
        dividerView5.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //checkBox button
        NSLayoutConstraint.activate([
            checkBoxStackView.topAnchor.constraint(equalToSystemSpacingBelow: accTypeVStackView.bottomAnchor, multiplier: 1),
            checkboxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ),
            
            checkLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 60)
        ])
        
    }
}

// MARK: - Extension AddNewBeneficiaryView TextField Delegate
extension AddNewBeneficiaryView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return value")

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("did end editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == accountNumber)
        {
            if string.isEmpty {
                accountNumberError.textColor = .red
                dividerView.backgroundColor = .red
                accountNumberError.isHidden = false
                return true
            }
            let regex = try! NSRegularExpression(pattern: "[0-9]+")
            let isValid = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count > 0
            return isValid
        }
        
        else if (textField == confirmAccNumber)
        {
            if string.isEmpty {
                confirmAccNumberError.textColor = .red
                dividerView1.backgroundColor = .red
                confirmAccNumberError.isHidden = false
                return true
            }
            let regex = try! NSRegularExpression(pattern: "[0-9]+")
            let isValid = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count > 0
            return isValid
        }
        else if (textField == nickName)
        {
            if string.isEmpty {
                setNickNameError.textColor = .red
                dividerView2.backgroundColor = .red
                setNickNameError.isHidden = false
                return true
            }
            let regex = try! NSRegularExpression(pattern: "[a-zA-Z]+")
            let isValid = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count > 0
            return isValid
        }
        else if (textField == beneficiaryName)
        {
            if string.isEmpty {
                benfNameError.textColor = .red
                dividerView3.backgroundColor = .red
                benfNameError.isHidden = false
                return true
            }
            do{
                let regex = try NSRegularExpression(pattern: "[a-zA-z]+")
                let isValid = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count > 0
                return isValid
            }
            catch {
                print(error)
            }
        }

      return true
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == accountNumber {
            accountNumberError.text = "Enter Account Number"
            accountNumberError.textColor = .gray
            dividerView.backgroundColor = .secondarySystemFill
            accountNumberError.isHidden = false
            return true
        }
        else
        {
            accountNumberError.isHidden = true
        }
        if textField == confirmAccNumber
        {
            confirmAccNumberError.text = "Confirm Account Number"
            confirmAccNumberError.textColor = .gray
            dividerView1.backgroundColor = .secondarySystemFill
            confirmAccNumberError.isHidden = false
            return true
        }
        else
        {
            confirmAccNumberError.isHidden = true
        }
      if textField == nickName
        {
            setNickNameError.text = "Enter nick name"
            setNickNameError.textColor = .gray
            dividerView2.backgroundColor = .secondarySystemFill
            setNickNameError.isHidden = false
            return true
        }
        else{
            setNickNameError.isHidden = true
        }
        if textField == beneficiaryName
        {
            benfNameError.text = "Enter beneficiary name"
            benfNameError.textColor = .gray
            dividerView3.backgroundColor = .secondarySystemFill
            benfNameError.isHidden = false
            return true
        }
        else{
            benfNameError.isHidden = true
        }
        return false
    }
}
