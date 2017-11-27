//
//  MovieListViewController+Extention.swift
//  TestApp
//
//  Created by Dev on 11/26/17.
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
    
    func displayNextPageSearchedItems(viewModel:MoviesDisplayList.NextPage.ViewModel){
        self.ViewModel =  MovieListViewModel(viewModel)
        self.tableData = self.tableData + viewModel.movieList
        self.tableView.reloadData()
    }
    
    func displayNextPageSearchedResultError(viewModel: MoviesDisplayList.NextPage.Response){
        UIAlertController.displayAlert(parentController: self, displayMsg: "Unable to display result.")
    }
    
}


extension MovieListViewController :MovieListPagingRequestProtocol  {
    
    func searchNextPageMovieItems(request: MoviesDisplayList.NextPage.Request){
        output?.loadNextPage(request: request)
    }
    
}
