//
//  MovieSearchModel.swift
//  TestApp
//
//  Created by Dev on 11/23/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation






enum MovieList {
    
    enum Search {
        struct Request {
            let queryText : String
            let page : Int
        }
        
        struct Response {
            var searchedTxt : String?
            var data : Data?
            var error: Error?
            
            func getResponseModel() -> ApiMoviesModel?{
                guard let data = data else {return nil }
                return data.getResponseModel
            }
        }
        
        struct ViewModel {
            let searchedText : String
            let currentPage : Int
            let totalPages  : Int
            let movieList :  [MovieItemViewModel]
            init(_ item : ApiMoviesModel , txt : String) {
                searchedText = txt
                currentPage =  item.page
                totalPages  =  item.total_pages
                movieList     = item.results.map{ return MovieItemViewModel($0) }
            }
        }
    }
    
    
    
    enum Suggestion {
        
        struct Request {
            var type : DBRequestType
            enum DBRequestType {
                case add(name : String)
                case getAll
            }
        }
        
        struct Response {
            let list: [MovieSuggestionViewModel]?
            var error: Error?
        }
        
        struct ViewModel {
            let list: [MovieSuggestionViewModel]
        }
    }
    
}


extension Data {
    
    var getResponseModel : ApiMoviesModel? {
        return   (try?  JSONDecoder().decode( ApiMoviesModel.self , from : self)) ?? nil
    }
}
