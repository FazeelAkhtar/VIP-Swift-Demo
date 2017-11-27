//
//  MovieListModel.swift
//  TestApp
//
//  Created by Dev on 11/24/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovieSearchItem: Object {
    @objc dynamic var id = ""
    override class func primaryKey() -> String? {
        return "id"
    }
}


struct ApiMoviesModel : Decodable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [ApiMovieItemModel]
}



struct  ApiMovieItemModel : Decodable {
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
