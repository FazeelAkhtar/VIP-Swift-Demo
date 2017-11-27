//
//  MovieSearchInteractorTest.swift
//  MovieListTests
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//


@testable import MovieList
import Foundation
import XCTest



class MovieSearchInteractorTest: XCTestCase {
    
    var  interactor  : MockMovieSearchInteractor?
    override func setUp() {
        super.setUp()
        interactor = MockMovieSearchInteractor()
    }
   
    
    
    
    func testSearchInteractorSearchFuncAndSuggestions(){

        let addItemInteractorOutputSpy = MockMovieSearchPresentert()
        interactor?.output = addItemInteractorOutputSpy
        
        let mockApiworker = MockMovieSearchApiWorker()
        interactor?.searchApiWorker = mockApiworker
        
        let mocDBWorker = MockDBWorker(itemStore: MovieSearchReleamService())
        interactor?.dbStore = mocDBWorker
        
        let request = MovieList.Suggestion.Request(type: .add(name: "Test"))
        interactor?.loadFromdummyDB(request: request)
        
        XCTAssertTrue( mocDBWorker.isMockMockDBWorkerCalled , "Presentor Display method not called from suggestion worker" )
        
        interactor?.loadFromDummySearchApi(request: MovieList.Search.Request(queryText: "Dummy", page: 1))
        XCTAssert(addItemInteractorOutputSpy.isOutPutPresenterCalled , "Presentor Display method not called from search worker")
    }
    
    
    
    
    
    
    
    
    
    
    
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
    
    
    
    class MockMovieSearchPresentert :  MovieSearchPresenterOutputProtocol {
        var isOutPutPresenterCalled : Bool = false
        
        func presentSearchResult (_ response: MovieList.Search.Response){
            isOutPutPresenterCalled  = true
        }
        func presentSavedSearchSuggestion (_ response: MovieList.Suggestion.Response){
            isOutPutPresenterCalled  = true
        }
        
    }
    
    
    

    class MockMovieSearchApiWorker :  MovieSearchApiWorker {
        var isMockMovieSearchApiWorkerCalled : Bool = false
        override func getSearchedMovie(_ request : MovieList.Search.Request , callBack :  @escaping searchApiCallback ){
            isMockMovieSearchApiWorkerCalled = true
            callBack(MovieApiSearchResult(data: nil , error: nil ))
        }
    }
    
    
    class MockDBWorker :  MovieDBWorker {
        var isMockMockDBWorkerCalled : Bool = false
       override  func executeRequest(request: MovieList.Suggestion.Request, callBack: ([MovieSuggestionViewModel], MovieSuggestionStoreError?) -> Void) {
            isMockMockDBWorkerCalled = true
            callBack( [] ,  nil )
        }
    
    }
}




    



