//
//  MovieSearchViewConfigurator.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit




/**
 MovieListViewConfigurator   :  This will setup outputs , inputs and worker and router protocols
 
 */


class MovieSearchViewConfigurator{
    
    class var sharedInstance: MovieSearchViewConfigurator{
        struct Static {
            static let instance =  MovieSearchViewConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: MovieSearchViewController){
        let router = MovieSearchRouter()
        router.viewController = viewController
        
        let presenter = MovieSearchPresenter()
        presenter.output = viewController
        
        let interactor = MovieSearchInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
