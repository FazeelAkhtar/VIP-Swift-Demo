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
   
    
    
    
    /**
        Check Interactor Funtionality by Creating Dummy interactor , presentor and worker
     */
    
    func testSearchInteractorSearchFuncAndSuggestions(){

        let addItemInteractorOutputSpy = MockMovieSearchPresentor()
        interactor?.output = addItemInteractorOutputSpy
        
        
        /**
          Create MockApiWorker
         */
        
        let mockApiworker = MockMovieSearchApiWorker()
        interactor?.searchApiWorker = mockApiworker

        /**
            Create mocDBWorker
         */

        
        let mocDBWorker = MockDBWorker(itemStore: MovieSearchReleamService())
        interactor?.dbStore = mocDBWorker
        
        /**
            Create MockRequest and Load DB
         */

        let request = MovieList.Suggestion.Request(type: .add(name: "Test"))
        interactor?.loadFromdummyDB(request: request)
        
        XCTAssertTrue( mocDBWorker.isMockMockDBWorkerCalled , TestStrings.presentorDisplayError )

        /**
            Create Mock Interactor and Load Mock search Api
         */

        interactor?.loadFromDummySearchApi(request: MovieList.Search.Request(queryText: "Dummy", page: 1))
        XCTAssert(addItemInteractorOutputSpy.isOutPutPresenterCalled , TestStrings.presentorDisplayError)
        
    }
    
    
}
    
    
    
    
    
    



    



