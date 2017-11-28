//
//  MovieListMockClasses.swift
//  MovieListTests
//
//  Created by Dev on 11/28/17.
//  Copyright © 2017 Dev. All rights reserved.
//

@testable import MovieList
import Foundation



/**
    Create Mock Interactor Class
 */


class MockMovieSearchInteractor : MovieSearchInteractor {
    
    func loadFromDummySearchApi(request: MovieList.Search.Request){
        searchApiWorker.getSearchedMovie(request){ [weak self] result in
            let response = MovieList.Search.Response(searchedTxt: "dummy" , data : Data() , error : NSError() )
            self?.output?.presentSearchResult(response)
        }
    }
    
    func loadFromdummyDB(request: MovieList.Suggestion.Request){
        self.dbStore.executeRequest(request: request) { _ , _ in
            let response = MovieList.Suggestion.Response(list: [] , error: NSError() )
            output?.presentSavedSearchSuggestion(response)
        }
    }
}



/**
    Create Mock Presentor Class
 */

class MockMovieSearchPresentor :  MovieSearchPresenterOutputProtocol {
    var isOutPutPresenterCalled : Bool = false
    
    func presentSearchResult (_ response: MovieList.Search.Response){
        isOutPutPresenterCalled  = true
    }
    func presentSavedSearchSuggestion (_ response: MovieList.Suggestion.Response){
        isOutPutPresenterCalled  = true
    }
    
}


/**
    Create Mock Search Woker Api
 */


class MockMovieSearchApiWorker :  MovieSearchApiWorker {
    var isMockMovieSearchApiWorkerCalled : Bool = false
    override func getSearchedMovie(_ request : MovieList.Search.Request , callBack :  @escaping searchApiCallback ){
        isMockMovieSearchApiWorkerCalled = true
        callBack(MovieApiSearchResult(data: nil , error: nil ))
    }
}

/**
    Create Mock DB Woker Api
 */


class MockDBWorker :  MovieDBWorker {
    var isMockMockDBWorkerCalled : Bool = false
    override  func executeRequest(request: MovieList.Suggestion.Request, callBack: ([MovieSuggestionViewModel], MovieSuggestionStoreError?) -> Void) {
        isMockMockDBWorkerCalled = true
        callBack( [] ,  nil )
    }
    
}

