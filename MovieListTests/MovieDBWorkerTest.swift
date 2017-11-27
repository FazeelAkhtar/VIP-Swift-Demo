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
    
    var  testDbStore = TestMovieDBWorker(itemStore: MovieSearchReleamService())
    override func setUp() {
        super.setUp()
        addSuggestionToDB(name: "Test1")
    }
    
}


extension MovieDBWorkerTest {
    
    
    func testDBItemkCheck(){
        var resultItems  : MovieSuggestionViewModel? = nil
         realSuggestion { (result , error) in
            guard error == nil else {  return XCTAssertNotNil(  nil , "Item not Present") }
            resultItems = result.first
            XCTAssertTrue( result.count > 0 , "Item not Present")
        }
            XCTAssertTrue(  resultItems != nil  , "Item not Present")
    }
    
    
    func testDbItemExist(){
        self.testDbStore.getItemWithName(id: "Test1", callback: { (result , error) in
            guard error == nil else { return XCTAssertNotNil(  nil , "Item not Present") }
            XCTAssertTrue( result?.title == "Test1"  , "Item is not Present")
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
