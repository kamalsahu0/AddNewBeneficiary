//
//  DataModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let selectBank: [SelectBank]
    let selectAccType: [String]
}

// MARK: - SelectBank
struct SelectBank: Codable {
    let bankName, ifscCode: String
}
