//
//  MovieListViewConfigurator.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit





/**
    MovieListViewConfigurator   :  This will setup outputs , inputs and worker and router protocols
 
 */

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
        
        /**
            MovieListViewRouter   :  For Routing to next ViewController
         */
        let router = MovieListViewRouter()
        router.viewController = viewController
        
        /**
            MovieListViewPresenter   :  This will be used to get result from interactor and display result
         */
        let presenter = MovieListViewPresenter()
        presenter.mOutPut = viewController
        /**
            MovieListViewInteractor   :  This will be used to get input from User and start search and api workers calls
         */
        let interactor = MovieListViewInteractor()
        interactor.mOutPut = presenter
        /**
         MovieListViewConfigurator   :  This will setup outputs , inputs and worker and router protocols
         */
        viewController.output = interactor
        viewController.router = router
    }
    
   

}





