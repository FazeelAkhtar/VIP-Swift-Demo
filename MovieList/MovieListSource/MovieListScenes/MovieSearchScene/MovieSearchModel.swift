//
//  MovieSearchModel.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation



/**
        MovieList  Model : This Model will be used to Search and DB Query
 */


enum MovieList {
    
    enum Search {
        
        /**
            MovieList  Request  : Pass Search Query and Page number
         */

        
        struct Request {
            let queryText : String
            let page : Int
        }
        
        /**
            MovieList  Response  : Result from Api with data and error
         */

        
        struct Response {
            var searchedTxt : String?
            var data : Data?
            var error: Error?
            
            /**
                getResponseModel  : convert Data into Data Model or Error
             */
            func getResponseModel() -> ApiMoviesModel?{
                guard let data = data else {return nil }
                return data.getResponseModel
            }
        }
        
        
        /**
            MovieList  ViewModel  : Convert ApiModel into ViewModel to be displaed on screen
         */
        
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
    
    
    
    
    /**
     MovieList  Suggestion  : Used to save query in db and  read from Db
     */
    
    
    enum Suggestion {
        
        /**
              Suggestion Request  :  send request to DB worker to add or Get
         */
        struct Request {
            var type : DBRequestType
            enum DBRequestType {
                case add(name : String)
                case getAll
            }
        }
        
        /**
            Suggestion Response  :  Get DB worker Response
         */

        struct Response {
            let list: [MovieSuggestionViewModel]?
            var error: Error?
        }
        
        /**
         Suggestion ViewModel  :  Response to DB View Model to display as Suggestions
         */
        struct ViewModel {
            let list: [MovieSuggestionViewModel]
        }
    }
    
}


extension Data {
    
    /**
     getResponseModel
     Covert Data to Model Objecvts by using Swift decodable protocol
     */
    var getResponseModel : ApiMoviesModel? {
        return   (try?  JSONDecoder().decode( ApiMoviesModel.self , from : self)) ?? nil
    }
}
