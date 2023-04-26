//
//  DataModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import Foundation

// MARK: - DataModel
class DataModel: Codable {
    let result: [BankModel]
}
// MARK: - BankModel
class BankModel: Codable {
    let selectBank: [SelectBank]
    let selectAccType: [String]
    
    enum CodingKeys: String, CodingKey {
           case selectBank = "select_Bank"
           case selectAccType = "select_Acc_Type"
       }
    init(selectBank: [SelectBank], selectAccType: [String]) {
        self.selectBank = selectBank
        self.selectAccType = selectAccType
    }
}

// MARK: - SelectBank
class SelectBank: Codable {
    let bankName, ifscCode: String
    
    enum CodingKeys: String, CodingKey {
        case bankName = "bank_Name"
        case ifscCode = "ifsc_Code"
    }
    
    init(bankName: String, ifscCode: String) {
        self.bankName = bankName
        self.ifscCode = ifscCode
    }
    
}
