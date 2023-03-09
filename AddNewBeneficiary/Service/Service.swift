//
//  Api.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 17/02/23.
//

import Foundation

class Service: NSObject {
    
    static let shareInstance = Service()
    
    
    func getAllBankData(complition: @escaping([BankModel]?, Error?) -> ()) {
        if let url = Bundle.main.url(forResource: "DataModelJson", withExtension: "json") {
            let decoder = JSONDecoder()
            
            do {
                var arrBankData = [BankModel]()
                let data = try Data(contentsOf: url)
                let result =  try decoder.decode(DataModel.self, from: data)
                for bank in result.result {
                    arrBankData.append(BankModel(selectBank: bank.selectBank, selectAccType: bank.selectAccType ))
                }
                print(arrBankData)
                complition(arrBankData, nil)
            } catch {
                debugPrint("error:\(error)")
                complition(nil, error)
            }
        }
        
    }
}

