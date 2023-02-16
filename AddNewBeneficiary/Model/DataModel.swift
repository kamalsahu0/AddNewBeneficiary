//
//  DataModel.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import Foundation

struct DataModel: Codable{
    let selectBank: [String]
//    let accNumber: String
//    let confAccNumber: String
//    let nickName: String
//    let benName: String
    let selectAccType: [String]
}

func loadJson()
{

    if let url = Bundle.main.url(forResource: "DataModelJson", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([DataModel].self, from: data)
            print(jsonData)

        } catch {
            print("error:\(error)")
        }
    }
}


