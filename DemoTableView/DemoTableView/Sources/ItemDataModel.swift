//
//  ItemDataModel.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 29/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

struct ItemDataModel {

    var title: String = ""
    var longDescription: String = ""
    var imageURL: String = ""
    
    fileprivate func setup(cell: ItemTableViewCell) {
        cell.fill(title: title, longDescription: longDescription, imageURL: imageURL)
    }
}

extension ItemDataModel: BaseCellModel {
    
    func cellIn(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemTableViewCell.self), for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        setup(cell: cell)
        
        return cell
    }
}
