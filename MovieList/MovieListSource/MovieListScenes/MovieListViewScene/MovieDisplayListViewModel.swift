//
//  MovieDisplayListViewModel.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation

enum MoviesDisplayList{
    
    enum  NextPage {
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
        
        struct ViewModel  {
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

    
    
}
