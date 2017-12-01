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



/**
    MovieSearchControllerInput delegate Call backs :
    Called when Presentor will call to udpate ViewController with Search Result , Suggestion and Error
 */

extension MovieSearchViewController : MovieSearchControllerInput {

    
    /**
        displaySearchedItems :
        Called when Presentor will call to udpate ViewController with Search Result
     */
    
    func displaySearchedItems(viewModel:MovieList.Search.ViewModel){
        if viewModel.movieList.count > 0 {
            mRouter?.routeToSearchListView(viewModel: viewModel)
            if let searchText = self.mSearchedQuery{
                self.executeSuggestionRequest(request: MovieList.Suggestion.Request(type: .add(name: searchText)) )
            }
        }else{
            UIAlertController.displayAlert(parentController: self, displayMsg: "No Search result found")
        }
        mIsAlreadySearching = false
    }
    
    
    /**
     displaySuggestions:
     Called when Presentor will call to udpate ViewController with  DB  Search Suggestions
     */
    
    func displaySuggestions(viewModel: MovieList.Suggestion.ViewModel){
        self.mTableData = viewModel.list
        self.tableView.reloadData()
    }
    
    
    /**
     displaySearchedResultError:
     Called when Presentor will call to udpate ViewController with  Error
     */
    
    func displaySearchedResultError(viewModel: MovieList.Search.Response){
        mIsAlreadySearching = false
        UIAlertController.displayAlert(parentController: self, displayMsg: "Unable to display result.Please try again")
    }
}


/**
 MovieSearchControllerOutput delegate Call backs :
 Called when interactor  will call to Execute  Search Api , Suggestion from Db
 */


extension MovieSearchViewController : MovieSearchControllerOutput {
    
    func executeSearchQuery(request: MovieList.Search.Request){
        mIsAlreadySearching = true
        mOutput?.loadFromSearchApi(request:  request)
    }
    
    func executeSuggestionRequest(request: MovieList.Suggestion.Request){
        mOutput?.loadFromDB(request: request)
    }
    
}
