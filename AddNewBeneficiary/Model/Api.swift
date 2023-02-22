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
        //  var dataModel: [DataModel]?
        
        if let url = Bundle.main.url(forResource: "DataModelJson", withExtension: "json") {
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: url)
                let jsonData =  try decoder.decode([DataModel].self, from: data)
                // dataModel = jsonData
                // debugPrint(jsonData)
                //return dataModel
                return jsonData
            } catch {
                debugPrint("error:\(error)")
            }
        }
        return []
    }
}

