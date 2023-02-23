//
//  ValidationForm.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 23/02/23.
//

import Foundation
import UIKit

func resetForm()
{
    continueBtn.isEnabled = false
    
    AccountNumberError.isHidden = false
    
    accountNumber.text = ""
}

func invalidAccountNumber(_ text: UITextField) -> Bool
{
    // Perform validation logic on the entered text
    let regex = try! NSRegularExpression(pattern: "[0-9]{10}")
    let isValid = regex.matches(in: text.text ?? "", options: [], range: NSRange(location: 0, length: text.text?.count ?? 0)).count > 0
    
    // Return true if the entered text is valid, false otherwise
    return isValid
}
