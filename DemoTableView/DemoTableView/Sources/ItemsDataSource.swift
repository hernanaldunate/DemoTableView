//
//  ItemsDataSource.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 29/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ItemsDataSource {
    
    fileprivate let url = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"
    fileprivate let cellType = ItemTableViewCell.self
    let title = "Laptops"
    
    func setup(detailController: DetailViewController, for cell: UITableViewCell) {
        guard let cell = cell as? ItemTableViewCell else { return }
        
        detailController.image = cell.thumbnailImageView.image
        detailController.descriptionText = cell.descriptionLabel.text
    }
}

extension ItemsDataSource: BaseCellDataSource {
    
    func fetchData(success: @escaping ([BaseCellModel]) -> (), failure: @escaping (Error?) -> ()) {
        Alamofire.request(url).responseJSON {
            response in
            
            switch response.result {
            case .success:
                guard let jsonResponse = response.result.value else {
                    failure(nil)
                    return
                }
                
                let json = JSON(jsonResponse)
                success(ItemsDataParser.itemModelsFromJson(json))
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func registerCellsIn(tableView: UITableView) {
        tableView.register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: String(describing: cellType))
    }
}
