//
//  ValidationForm.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 23/02/23.
//

import Foundation
import UIKit

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
            dividerView1.backgroundColor = .secondarySystemFill
            confirmAccNumberError.isHidden = true
            return true
        }
}

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

func validateForm() -> Bool {
 
    if accountNumberValidation {
        return true
    }
    else if confirmAccNumberValidation {
        return true
    }
    else if nickNameValidation {
        return true
    }
    else if beneficiaryNameValidation {
        return true
    }
    else
    {
        return false
    }
    
}

