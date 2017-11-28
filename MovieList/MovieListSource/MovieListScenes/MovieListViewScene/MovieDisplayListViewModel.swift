//
//  MovieDisplayListViewModel.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation


/**
        MoviesDisplayList  Model : This Model will be used to load Next page
 */


enum MoviesDisplayList{
    
    enum  NextPage {
        /**
            Next Page.Request : Things needed to load Next Page
        */
        struct Request {
            let queryText : String
            let page : Int
        }

        /**
            Next Page.Response : Result of Paging result view
         */
        
        struct Response {
            var searchedTxt : String?
            var data : Data?
            var error: Error?
            func getResponseModel() -> ApiMoviesModel?{
                guard let data = data else {return nil }
                return data.getResponseModel
            }
        }

        /**
            Next Page.View Model : Result transformed into viewmodel to display Current loaded Page result
         */
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
