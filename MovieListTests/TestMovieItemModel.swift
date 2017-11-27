//
//  TestMovieItemModel.swift
//  MovieListTests
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//



@testable import MovieList

import XCTest
import Foundation





class TestMovieItemModel: XCTestCase {
    
    var movieDetailItemtModel : ApiMovieItemModelTest? = nil
    override func setUp() {
        super.setUp()
        movieDetailItemtModel = MovieTestUtill.readTestMovieJsonModel()
    }
    
}


extension TestMovieItemModel {
    
    
    func testMovieLisItemtModel_Nil (){
        XCTAssertNotNil( movieDetailItemtModel , "Movie Item Model  Json is not correct")
    }
    
    
    func testMovieItemModel_Id_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.id == 41 , "id is not correct")
    }
    
    func testMovieItemModel_Id_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.id == 16 , "id is not correct")
    }
    
    
    func testMovieItemModel_VoteCount_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.vote_count == 0 , "VoteCount is not correct")
    }
    
    func testMovieItemModel_VoteCount_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.vote_count == 2 , "VoteCount is not correct")
    }
    
    func testMovieItemModel_Vote_Average_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.vote_average == 0 , "vote_average is not correct")
    }
    
    func testMovieItemModel_Vote_Average_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.vote_average == 2 , "vote_average is not correct")
    }
    
    
    func testMovieItemModel_PostPath_Nil (){
        XCTAssertNotNil( movieDetailItemtModel?.poster_path  , "Post Path is not correct")
    }
    
    func testMovieItemModel_PostPath_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.poster_path == "/y1LxulrIDaxw52CyiDF2FpQPhSn.jpg" , "Post Path is not correct")
    }
    
    func testMovieItemModel_PostPath_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.poster_path != "/y1LxulrIDaxw52CyiDF2FpQPhSn.jpg" , "Poster Path is not correct")
    }
    
    
    func testMovieItemModel_title_Nil (){
        XCTAssertNotNil( movieDetailItemtModel?.title  , "Title is not correct")
    }
    
    func testMovieItemModel_title_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.title == "Hong Kong Superman" , "title  is not correct")
    }
    
    func testMovieItemModel_title_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.title != "Hong Kong Superman" , "title  is not correct")
    }
    
    func testMovieItemModel_Overview_Nil (){
        XCTAssertNotNil( movieDetailItemtModel?.overview  , "Title is not correct")
    }
    
    func testMovieItemModel_Overview_Pass (){
        XCTAssertTrue( movieDetailItemtModel?.overview == "Hong Kong Superman." , "title  is not correct")
    }
    
    func testMovieItemModel_Overview_Fail (){
        XCTAssertFalse( movieDetailItemtModel?.overview != "Hong Kong Superman." , "title  is not correct")
    }
    
}
