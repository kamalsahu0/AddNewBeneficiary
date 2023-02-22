//
//  DataModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    var selectBank: [SelectBank]
    let selectAccType: [String]
}

// MARK: - SelectBank
struct SelectBank: Codable {
    var bankName, ifscCode: String
}
