//
//  MovieListModel.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation
import RealmSwift


/**
    Create Releam Model For Searched Item
    @param id = title
 */


class RealmMovieSearchItem: Object {
    @objc dynamic var id = ""
    override class func primaryKey() -> String? {
        return "id"
    }
}


/**
    Create Api Movie List Model , automatically decoded to Model from Json Swift 4 Decodable.
 */

struct ApiMoviesModel : Decodable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [ApiMovieItemModel]
}


/**
    Create Api Movie Item Detail Model , automatically decoded to Model from Json Swift 4 Decodable.
 */


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
