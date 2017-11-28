//
//  FeedItemInteractor.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//

import UIKit

protocol MovieSearchProtocol { // input from view{
  func loadFromSearchApi(request: MovieList.Search.Request)
  func loadFromDB(request: MovieList.Suggestion.Request)
}


class MovieSearchInteractor {
  var output: MovieSearchPresenterOutputProtocol? // output presenter
  var  dbStore = MovieDBWorker(itemStore: MovieSearchReleamService())
  var  searchApiWorker  = MovieSearchApiWorker()
}


extension MovieSearchInteractor : MovieSearchProtocol {
    
    
    /**
     loadFromSearchApi   :  Load  Search String from Api
     @param :  ieList.Search.Request , pass search query
     
     */
    
    func loadFromSearchApi(request: MovieList.Search.Request){
        searchApiWorker.getSearchedMovie(request){ [weak self] result in
            let response = MovieList.Search.Response(searchedTxt: request.queryText , data : result.data , error : result.error )
            self?.output?.presentSearchResult(response)
        }
    }
    
    /**
     loadFromDB   :  Load Suggestion from Db
     @param :   MovieList.Suggestion.Request to get DB Searched Query
     
     */
    
    func loadFromDB(request: MovieList.Suggestion.Request){
        dbStore.executeRequest(request: request) { result , error  in
                let response = MovieList.Suggestion.Response(list: result , error: error )
                output?.presentSavedSearchSuggestion(response)
        }
        
    }
}
