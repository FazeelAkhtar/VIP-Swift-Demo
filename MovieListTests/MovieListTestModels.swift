//
//  MovieListTestModels.swift
//  MovieListTests
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import Foundation
import RealmSwift

class TestRealmMovieSearchItem: Object {
    @objc dynamic var id = ""
    override class func primaryKey() -> String? {
        return "id"
    }
}


struct ApiMoviesModelTest : Decodable {
    let page : Int
    let total_results : Int
    let totalpages : Int
    let results : [ApiMovieItemModelTest]
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





