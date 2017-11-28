//
//  MovieListViewController+Extention.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit

protocol MovieListPagingResultProtocol {
    
    func displayNextPageSearchedItems(viewModel:MoviesDisplayList.NextPage.ViewModel)
    func displayNextPageSearchedResultError(viewModel: MoviesDisplayList.NextPage.Response)
    
    
}

protocol MovieListPagingRequestProtocol{
    func searchNextPageMovieItems(request: MoviesDisplayList.NextPage.Request)
}



extension MovieListViewController :  MovieListPagingResultProtocol{
    
    /**
        displayNextPageSearchedItems :  Display viewmodel for results
     */
    
    func displayNextPageSearchedItems(viewModel:MoviesDisplayList.NextPage.ViewModel){
        self.ViewModel =  MovieListViewModel(viewModel)
        self.tableData = self.tableData + viewModel.movieList
        self.tableView.reloadData()
    }
    
    /**
        displayNextPageSearchedResultError :  Display viewmodel Error
     */
    
    func displayNextPageSearchedResultError(viewModel: MoviesDisplayList.NextPage.Response){
        UIAlertController.displayAlert(parentController: self, displayMsg: "Unable to display result.")
    }
    
}


extension MovieListViewController :MovieListPagingRequestProtocol  {
    
    /**
        searchNextPageMovieItems :  Load Next Page
     */
    
    
    func searchNextPageMovieItems(request: MoviesDisplayList.NextPage.Request){
        output?.loadNextPage(request: request)
    }
    
}
