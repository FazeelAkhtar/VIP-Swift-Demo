//
//  MovieDBWorkerTest.swift
//  MovieListTests
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//


@testable import MovieList
import Foundation
import XCTest

struct TestStrings {
    static let itemNotExist = "Item not Present"
    static let presentorDisplayError = "Presentor Display method not called from suggestion worker"
}


class TestMovieDBWorker : MovieDBWorker {
    
    func getItemWithName (id : String , callback : MovieStoreItemCallBack){
        self.itemStore.fetchItem(id: id, completionHandler: callback)
    }
    
    func deleteItemWithName (id : String ){
        self.itemStore.deleteItem(id: id ){ result in 
        }
    }
}

class MovieDBWorkerTest: XCTestCase {
    
    
    /**
        1.Create MockDB Class to manage DB Services.
        2.Add a test item in DB
     */
    
    var  testDbStore = TestMovieDBWorker(itemStore: MovieSearchReleamService())
    override func setUp() {
        super.setUp()
        addSuggestionToDB(name: "Test1")
    }
    
}


extension MovieDBWorkerTest {
    
    
    /**
        Tells DB Item is added properly in DB.
        Check count of items added > 0
     */
    
    func testDBItemCheck(){
        var resultItems  : MovieSuggestionViewModel? = nil
         realSuggestion { (result , error) in
            guard error == nil else {  return XCTAssertNotNil(  nil , TestStrings.itemNotExist) }
            resultItems = result.first
            XCTAssertTrue( result.count > 0 , TestStrings.itemNotExist)
        }
            XCTAssertTrue(  resultItems != nil  , TestStrings.itemNotExist)
    }
    
    
    
    /**
     Tells DB Item is added properly in DB.
     Check Item Added is same name as requested
     */
    
    func testDbItemExist(){
        self.testDbStore.getItemWithName(id: "Test1", callback: { (result , error) in
            guard error == nil else { return XCTAssertNotNil(  nil , TestStrings.itemNotExist) }
            XCTAssertTrue( result?.title == "Test1"  , TestStrings.itemNotExist)
        })
      self.testDbStore.deleteItemWithName(id: "Test1")
    }
}





extension MovieDBWorkerTest {
    
    func addSuggestionToDB(name : String ){
        let req = MovieList.Suggestion.Request.init(type: .add(name: name))
        testDbStore.executeRequest(request: req ,  callBack: { result , error in
            
        })
    }
    
    func realSuggestion( callback : MovieStoreAllItemWithErrorCallBack )  {
        let req = MovieList.Suggestion.Request(type: .getAll)
        testDbStore.executeRequest(request: req ,  callBack: callback)
    }
    
   
    
}
