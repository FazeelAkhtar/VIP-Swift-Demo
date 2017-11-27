//
//  MovieSearchViewController+Extention.swift
//  TestApp
//
//  Created by Dev on 11/26/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit

protocol MovieSearchControllerInput {
    
    func displaySearchedItems(viewModel:MovieList.Search.ViewModel)
    func displaySuggestions(viewModel: MovieList.Suggestion.ViewModel)
    func displaySearchedResultError(viewModel: MovieList.Search.Response)
}


protocol MovieSearchControllerOutput{
    
    func executeSearchQuery(request: MovieList.Search.Request)
    func executeSuggestionRequest(request: MovieList.Suggestion.Request)
}

extension MovieSearchViewController : MovieSearchControllerOutput {
    
    func displaySearchedItems(viewModel:MovieList.Search.ViewModel){
        if viewModel.movieList.count > 0 {
            router?.routeToSearchListView(viewModel: viewModel)
            if let searchText = self.searchedQuery{
                self.executeSuggestionRequest(request: MovieList.Suggestion.Request(type: .add(name: searchText)) )
            }
        }else{
            UIAlertController.displayAlert(parentController: self, displayMsg: "No Search result found")
        }
        isAlreadySearching = false
    }
    
    func displaySuggestions(viewModel: MovieList.Suggestion.ViewModel){
        self.tableData = viewModel.list
        self.tableView.reloadData()
    }
    
    func displaySearchedResultError(viewModel: MovieList.Search.Response){
        isAlreadySearching = false
        UIAlertController.displayAlert(parentController: self, displayMsg: "Unable to display result.Please try again")
    }
}


extension MovieSearchViewController : MovieSearchControllerInput {
    
    func executeSearchQuery(request: MovieList.Search.Request){
        isAlreadySearching = true
        output?.loadFromSearchApi(request:  request)
    }
    
    func executeSuggestionRequest(request: MovieList.Suggestion.Request){
        output?.loadFromDB(request: request)
    }
    
}
