//
//  UIViewExtension.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 31/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

protocol UIViewFromNib {}
extension UIView : UIViewFromNib {}

extension UIViewFromNib where Self: UIView {
    static func fromNib() -> Self {
        let nibName = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}
