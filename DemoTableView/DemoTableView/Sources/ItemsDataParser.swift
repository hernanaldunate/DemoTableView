//
//  ItemsDataParser.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 29/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import SwiftyJSON

class ItemsDataParser: NSObject {

    static func itemModelsFromJson(_ json: JSON) -> [ItemDataModel] {
        var result = [ItemDataModel]()
        let array = json.arrayValue
        
        array.forEach { item in
            let dataModel = ItemDataModel(title: item["title"].stringValue, longDescription: item["description"].stringValue, imageURL: item["image"].stringValue)
            result.append(dataModel)
        }
        
        return result
    }
}
