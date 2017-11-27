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

protocol MovieSearchDataPassing
{
 // var dataStore: MovieSearchDataStore? { get }
}

class MovieSearchRouter : NSObject, MovieSearchRoutingLogic //, MovieSearchDataPassing
{
  weak var viewController: MovieSearchViewController?
  var dataStore: MovieSearchDataPassing?
  
    
    func routeToSearchListView (viewModel: MovieList.Search.ViewModel){
        let detailView = MovieListViewController(with: MovieListViewModel( viewModel))
        viewController?.navigationController?.show(detailView, sender: nil)
    }
   
}
