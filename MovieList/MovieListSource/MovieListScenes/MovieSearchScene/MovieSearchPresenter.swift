//
//  FeedItemPresenter.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//
//

import UIKit

protocol MovieSearchPresenterOutputProtocol // input from interactor
{
  func presentSearchResult (_ response: MovieList.Search.Response)
  func presentSavedSearchSuggestion (_ response: MovieList.Suggestion.Response)

}

class MovieSearchPresenter: MovieSearchPresenterOutputProtocol{
   var output: MovieSearchControllerInput? // output

 func presentSavedSearchSuggestion (_ response: MovieList.Suggestion.Response){

        guard response.error == nil  else { return }
        guard let apiModel = response.list  else { return }
        if  apiModel.count > 0   {
            let viewModel = MovieList.Suggestion.ViewModel(list: apiModel)
            output?.displaySuggestions(viewModel: viewModel)
        }
  }
    
    
    func presentSearchResult (_ response: MovieList.Search.Response){
        guard response.error == nil  else {
            output?.displaySearchedResultError(viewModel: response) ; return
        }
        
        if let apiModel = response.getResponseModel(){
            if let searchedTxt  = response.searchedTxt{
                    let viewModel = MovieList.Search.ViewModel(apiModel , txt : searchedTxt)
                    output?.displaySearchedItems(viewModel: viewModel)
            }
        }
    }
}
