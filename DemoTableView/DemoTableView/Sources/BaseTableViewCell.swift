//
//  BaseTableViewCell.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 29/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

protocol BaseCellModel {
    
    func cellIn(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

protocol BaseCellDataSource {
    
    func fetchData(success: @escaping ([BaseCellModel]) -> (), failure: @escaping (Error?) -> ())
    func registerCellsIn(tableView: UITableView)
}
