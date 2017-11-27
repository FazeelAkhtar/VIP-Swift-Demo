//
//  FeedItemRouter.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//
//

import UIKit

@objc protocol MovieListViewRouterLogic
{
  func routeToNextScreen(segue: UIStoryboardSegue?)
}



class MovieListViewRouter: NSObject, MovieListViewRouterLogic //, MovieListViewRouterDataPassing
{
  var viewController: MovieListViewController?
    
    func routeToNextScreen(segue: UIStoryboardSegue?){
        
    }
  
}
