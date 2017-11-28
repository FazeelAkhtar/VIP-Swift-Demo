//
//  FeedItemRouter.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//
//

import UIKit

@objc protocol MovieSearchRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}


/**
    MovieSearchRouter   :  Router is used to pass data from view to view
 
 */


class MovieSearchRouter : NSObject, MovieSearchRoutingLogic
{
  weak var viewController: MovieSearchViewController?
  
    func routeToSearchListView (viewModel: MovieList.Search.ViewModel){
        let detailView = MovieListViewController(with: MovieListViewModel( viewModel))
        viewController?.navigationController?.show(detailView, sender: nil)
    }
   
}
