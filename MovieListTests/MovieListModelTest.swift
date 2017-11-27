//
//  MovieListModel.swift
//  TestApp
//
//  Created by Dev on 11/24/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//


import XCTest
@testable import MovieList



struct ApiMoviesModelTest : Decodable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [ApiMovieItemModel]
}



struct  ApiMovieItemModelTest : Decodable {
    let vote_count: Int
    let id: Int
    let video: Bool
    let vote_average: Double
    let title: String?
    let popularity: Double
    let poster_path: String?
    let original_language: String?
    let original_title : String?
    let genre_ids: [Int]
    let backdrop_path : String? = nil
    let adult: Bool?
    let overview: String?
    let release_date: String?
}


class MovieListTests: XCTestCase {
    
    var movieListModel : ApiMoviesModelTest? = nil
    override func setUp() {
        super.setUp()
        let movieModel = MovieTestUtill.readTestApiJsonModel(fileName: <#T##String#>)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
}
