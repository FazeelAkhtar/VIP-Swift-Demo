//
//  TableView+Extentions.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit



/**
 ReusableCellHosting Protocol
 Genric Cell for registration for tableview
 */


protocol ReusableCellHosting {
    
    func register<T>(cell: T.Type) where T: UITableViewCell  // Register Nib UItableviewcell
    func dequeueReusableCell<T: ReusableCell>(with cell: T.Type) -> T? //get dequeue generic UITableviewcell
    
}

extension UITableView  : ReusableCellHosting {
    /**
        @param : Generic Cell type
        @result : None
        Genric Cell for registration for tableview
    */
    
    func register<T>(cell: T.Type) where T: UITableViewCell {
        register(cell.nib, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: ReusableCell>(with cell: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.reuseIdentifier) as? T
    }
}
