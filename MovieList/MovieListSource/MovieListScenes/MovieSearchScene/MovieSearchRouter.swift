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
    
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: FeedItemViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: FeedItemDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
