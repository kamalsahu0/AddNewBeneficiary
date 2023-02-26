//
//  Globalconstant.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 22/02/23.
//

import Foundation
import UIKit

// MARK: - Main screen launch button
let launchBtn = UIButton(type: .system)

// MARK: - object of json api
let jsonData = FetchApi().loadJson()

// MARK: - dropdown constant text
let selectBankConst = "Select Bank"
let sltAccTypeConst = "Select account type"

// MARK: - Form properties
let details = UILabel()
let bnkSltTextLabel = UILabel()
let sltAccTypeTextLabel = UILabel()
let bankSltBtn = UIButton(type: .custom)
let selectAccTypeBtn = UIButton(type: .custom)
let accountNumber = UITextField()
let confirmAccNumber = UITextField()
let nickName = UITextField()
let lebelData = UILabel()
let beneficiaryName = UITextField()

let dividerView = UIView()
let dividerView1 = UIView()
let dividerView2 = UIView()
let dividerView3 = UIView()
let dividerView4 = UIView()
let dividerView5 = UIView()

// MARK: - checkbox
let checkboxButton = UIButton(type: .custom)
let checkLabel = UILabel()
let checkIcon = UIImageView()

// MARK: - Continue btn and create object of continue view
let continueBtn = UIButton(type: .custom)
let buttonView = ContinueButtonView()

// MARK: - Enter Ifsc
let ifsclabel = UILabel()

// MARK: - ifsc code
let ifscCode = UILabel()
// MARK: - ifsc code divider view
let dividerLabel = UIView()

// MARK: - Validations 
var accountNumberError = UILabel()

var confirmAccNumberError = UILabel()

var setNickNameError = UILabel()

var benfNameError = UILabel()

