//
//  ViewController.swift
//  MovieList
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var startButton      : UIButton!
    
    @IBAction  func buttonStartPressed( id : Any){
        let detailView1 = MovieSearchViewController(with:   [])
        let nav =   UINavigationController.init(rootViewController: detailView1)
        self.navigationController?.present(nav , animated: true , completion: nil )
    }
}

