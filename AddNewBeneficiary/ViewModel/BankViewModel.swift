//
//  BankViewModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 06/03/23.
//

import Foundation

class BankViewModel {
    let selectBank: [SelectBank]
    let selectAccType: [String]
    
    init(bank: BankModel) {
        self.selectBank = bank.selectBank
        self.selectAccType = bank.selectAccType
    }
}
