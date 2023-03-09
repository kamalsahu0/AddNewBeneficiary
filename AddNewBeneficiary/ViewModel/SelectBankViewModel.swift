//
//  SelectBankViewModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 08/03/23.
//

import Foundation

class SelectBankViewModel {
    
    let bankName, ifscCode: String
    
    enum CodingKeys: String, CodingKey {
        case bankName = "bank_Name"
        case ifscCode = "ifsc_Code"
    }
    
    init(bank: SelectBank) {
        self.bankName = bank.bankName
        self.ifscCode = bank.ifscCode
    }
}
