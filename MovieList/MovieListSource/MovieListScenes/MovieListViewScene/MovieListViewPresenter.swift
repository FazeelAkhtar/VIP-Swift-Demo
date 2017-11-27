//
//  FeedItemPresenter.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//
//

import UIKit

protocol MovieListPresenterProtocol
{
  func displayNextPageSearchedMovies (response: MoviesDisplayList.NextPage.Response)

}

class MovieListViewPresenter: MovieListPresenterProtocol
{
   var outPut: MovieListPagingResultProtocol?
  
  
  func displayNextPageSearchedMovies(response: MoviesDisplayList.NextPage.Response){
    guard response.error == nil  else {
        outPut?.displayNextPageSearchedResultError(viewModel: response) ; return
    }
    
    if let apiModel = response.getResponseModel(){
        if let searchedTxt  = response.searchedTxt{
            let viewModel = MoviesDisplayList.NextPage.ViewModel(apiModel , txt : searchedTxt)
            outPut?.displayNextPageSearchedItems(viewModel: viewModel)
        }
    }else{
        outPut?.displayNextPageSearchedResultError(viewModel: response) ; return
    }
  }
}
