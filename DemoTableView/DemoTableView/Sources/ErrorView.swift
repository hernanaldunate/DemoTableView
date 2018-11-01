//
//  ErrorView.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 31/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var message: String! {
        didSet {
            messageLabel.text = message
        }
    }
}
