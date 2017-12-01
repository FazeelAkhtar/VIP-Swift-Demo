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
   var mOutPut: MovieListPagingResultProtocol?
  
    /**
        displayNextPageSearchedMovies   :  Display Error and result from Next Page loading
        Also convert response into ViewModel , which need to be displayed on UIView
        @param :   MoviesDisplayList.NextPage.Request which contains current page , search query
     
     */
    
  
  func displayNextPageSearchedMovies(response: MoviesDisplayList.NextPage.Response){
    guard response.error == nil  else {
        mOutPut?.displayNextPageSearchedResultError(viewModel: response) ; return
    }
    
    if let apiModel = response.getResponseModel(){
        if let searchedTxt  = response.searchedTxt{
            let viewModel = MoviesDisplayList.NextPage.ViewModel(apiModel , txt : searchedTxt)
            mOutPut?.displayNextPageSearchedItems(viewModel: viewModel)
        }
    }else{
        mOutPut?.displayNextPageSearchedResultError(viewModel: response) ; return
    }
  }
}
