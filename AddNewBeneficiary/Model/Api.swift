//
//  Api.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 17/02/23.
//

import Foundation

struct FetchApi {
    
    func loadJson() -> [DataModel]?
    {
        if let url = Bundle.main.url(forResource: "DataModelJson", withExtension: "json") {
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: url)
                let jsonData =  try decoder.decode([DataModel].self, from: data)
                return jsonData
            } catch {
                debugPrint("error:\(error)")
            }
        }
        return []
    }
}

