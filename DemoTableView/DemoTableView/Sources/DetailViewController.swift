//
//  DetailViewController.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 30/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet weak var descriptionContainer: UIView!
    
    var image: UIImage!
    var descriptionText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionContainer.alpha = 1
        longDescription.text = descriptionText
        fullImageView.image = image
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.descriptionContainer.alpha = 1 - strongSelf.descriptionContainer.alpha
            strongSelf.view.layoutIfNeeded()
        })
    }
}
