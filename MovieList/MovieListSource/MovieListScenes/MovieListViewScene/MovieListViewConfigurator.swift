//
//  MovieListViewConfigurator.swift
//  TestApp
//
//  Created by Dev on 11/24/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit






class MovieListViewConfigurator{
    // MARK: Object lifecycle
    
    class var sharedInstance: MovieListViewConfigurator{
        struct Static {
            static let instance =  MovieListViewConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    
    func configure(viewController: MovieListViewController){
        let router = MovieListViewRouter()
        router.viewController = viewController
        
        let presenter = MovieListViewPresenter()
        presenter.outPut = viewController
        
        let interactor = MovieListViewInteractor()
        interactor.outPut = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
    
   

}





