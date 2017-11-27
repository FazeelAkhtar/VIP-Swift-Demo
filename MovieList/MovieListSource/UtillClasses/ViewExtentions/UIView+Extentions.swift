//
//  UIView+Extentions.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit


/**
 Genric nib with Current identifier String
 */


extension UIView {
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}


/**
 Genric XIX instantiate func
 */

extension UINib {
    func instantiate() -> Any? {
        return self.instantiate(withOwner: nil, options: nil).first
    }
}


extension UIAlertController {
    
   class  func displayAlert( parentController : UIViewController , displayMsg : String){
        let alertView = UIAlertController(title: "", message: displayMsg , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler:nil)
        alertView.addAction(action)
        parentController.present(alertView, animated: true, completion: nil)
    }
    
}
