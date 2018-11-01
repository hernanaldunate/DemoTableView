//
//  ItemTableViewCell.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 28/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit
import SDWebImage

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func fill(title: String, longDescription: String, imageURL: String) {
        titleLabel.text = title
        descriptionLabel.text = longDescription
        thumbnailImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder_thumbnail"))
    }
}
