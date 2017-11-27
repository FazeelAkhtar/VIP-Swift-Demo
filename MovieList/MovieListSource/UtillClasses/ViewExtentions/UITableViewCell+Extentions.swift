//
//  UITableViewCell+Extentions.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit


protocol ReusableCell {
    static var reuseIdentifier: String { get }
}



/**
 @param : ConfigurableCell
 Genric Cell for config funtion 
 */

protocol ConfigurableCell : ReusableCell {
    associatedtype T
    func configure(_ item: T, at indexPath: IndexPath)
}

extension UITableViewCell : ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
