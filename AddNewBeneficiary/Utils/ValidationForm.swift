//
//  ValidationForm.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 23/02/23.
//

import Foundation
import UIKit

// MARK: - Account number Validation
var accountNumberValidation: Bool {
    
    if accountNumber.text?.isEmpty ?? true {
        accountNumberError.text = "Enter Account Number"
        accountNumberError.textColor = .red
        dividerView.backgroundColor = .red
        accountNumberError.isHidden = false
        return false
    } else {
        dividerView.backgroundColor = .secondarySystemFill
        accountNumberError.isHidden = true
        return true
    }
}

// MARK: - Confirm Account number Validation
var confirmAccNumberValidation: Bool {
    // Check confirm number is empty
        if confirmAccNumber.text?.isEmpty ?? true {
            confirmAccNumberError.text = "Confirm Account Number"
            confirmAccNumberError.textColor = .red
            dividerView1.backgroundColor = .red
            confirmAccNumberError.isHidden = false
            return false
        }
        else {
            if confirmAccNumber.text == accountNumber.text
            {
                dividerView1.backgroundColor = .secondarySystemFill
                confirmAccNumberError.isHidden = true
                return true
            }
            else
            {
                confirmAccNumberError.text = "Confirm account number does not match"
                confirmAccNumberError.textColor = .red
                dividerView1.backgroundColor = .red
                confirmAccNumberError.isHidden = false
                return false
            }
           
        }
}

// MARK: - Nick name Validation
var nickNameValidation: Bool {
    // Check nickName is empty
        if nickName.text?.isEmpty ?? true {
            setNickNameError.text = "Enter nick name"
            setNickNameError.textColor = .red
            dividerView2.backgroundColor = .red
            setNickNameError.isHidden = false
            return false
        }
        else {
            dividerView2.backgroundColor = .secondarySystemFill
            setNickNameError.isHidden = true
            return true
        }
}

// MARK: - Beneficiary Name Validation
var beneficiaryNameValidation: Bool{
    //check benef Name is Empty
    if beneficiaryName.text?.isEmpty ?? true {
        benfNameError.text = "Enter Beneficiary name"
        benfNameError.textColor = .red
        dividerView3.backgroundColor = .red
        benfNameError.isHidden = false
        return false
    }
    else {
        dividerView3.backgroundColor = .secondarySystemFill
        benfNameError.isHidden = true
        return true
    }
}


// MARK: - Validate Form
func validateForm() -> Bool {
 
    if accountNumberValidation {
        debugPrint("account number valid")
    }
    if confirmAccNumberValidation {
        debugPrint("Confirm account number valid")
        
    }
    if nickNameValidation {
        debugPrint("Nick name valid")
    }
    if beneficiaryNameValidation {
        debugPrint("Beneficiary name valid")
    }
    else
    {
        return false
    }
    return true
}

