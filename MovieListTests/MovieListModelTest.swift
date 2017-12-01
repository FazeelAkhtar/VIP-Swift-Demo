//
//  MovieListModel.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//


@testable import MovieList

import XCTest
import Foundation





class MovieListTests: XCTestCase {
    
    var movieListModel : ApiMoviesModelTest? = nil
    override func setUp() {
        super.setUp()
        movieListModel = MovieTestUtill.readTestApiJsonModel()
    }
    
}


extension MovieListTests {
    
    func testMovieListModel_Nil (){
        XCTAssertNotNil( movieListModel , "Movies List Json is not correct")
    }
    
    func testMovieListModel_Page_Pass (){
        XCTAssertTrue( movieListModel?.page == 3 , "Movies List Page is not correct")
    }

    func testMovieListModel_Page_Fail (){
        XCTAssertFalse( movieListModel?.page == 0 , "Movies List Page is not correct")
    }
    
    
    func testMovieListModel_TotalPage_Pass (){
        XCTAssertTrue( movieListModel?.total_pages == 7 , "Movies List Page is not correct")
    }
    
    func testMovieListModel_TotalPage_Fail (){
        XCTAssertFalse( movieListModel?.total_pages == 125 , "Movies List Page is not correct")
    }
    
    
    func testMovieListModel_ResultList_Pass (){
        XCTAssertTrue( movieListModel?.results.count == 11 , "Movies List Page is not correct")
    }
    
    func testMovieListModel_ResultList_Fail (){
        XCTAssertFalse( movieListModel?.results.count  == 14 , "Movies List Page is not correct")
    }
    

    
}
