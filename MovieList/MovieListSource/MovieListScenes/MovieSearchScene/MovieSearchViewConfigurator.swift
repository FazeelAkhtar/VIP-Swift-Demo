//
//  MovieSearchViewConfigurator.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit





class MovieSearchViewConfigurator{
    // MARK: Object lifecycle
    
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
