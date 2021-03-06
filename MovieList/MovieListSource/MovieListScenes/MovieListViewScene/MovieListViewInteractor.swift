//
//  FeedItemInteractor.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//

import UIKit

protocol MovieListViewProtocol
{
  func loadNextPage(request: MoviesDisplayList.NextPage.Request)
}


class MovieListViewInteractor {
  var mOutPut : MovieListPresenterProtocol?
  
}

extension MovieListViewInteractor : MovieListViewProtocol {
    
    /**
        loadNextPage   :  Load Next Search Page
        @param :   MoviesDisplayList.NextPage.Request which contains current page , search query 
     
     */
    
    func loadNextPage(request: MoviesDisplayList.NextPage.Request){
        let worker  = MovieListViewWorker()
        let req = MovieList.Search.Request(queryText: request.queryText, page: request.page)
        worker.getSearchedMovie(req){ [weak self] result in
            let response = MoviesDisplayList.NextPage.Response(searchedTxt: request.queryText , data : result.data , error : result.error )
            self?.mOutPut?.displayNextPageSearchedMovies(response: response)
        }

    }
    
}
