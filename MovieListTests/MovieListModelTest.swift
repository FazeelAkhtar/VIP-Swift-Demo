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
    var movieDetailItemtModel : ApiMovieItemModelTest? = nil
    override func setUp() {
        super.setUp()
        movieListModel = MovieTestUtill.readTestApiJsonModel()
        movieDetailItemtModel = MovieTestUtill.readTestMovieJsonModel()
    }
    
    
}
