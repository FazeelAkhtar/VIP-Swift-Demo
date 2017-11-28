//
//  FeedItemApiService.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation
import Alamofire




protocol MovieApiResult {
    var data : Data? {get}
    var error: Error? {get}
}

struct MovieApiSearchResult  : MovieApiResult{
    var data : Data?
    var error: Error?
}



/**
    MovieListSearchApiService
    Low level Api Calls with request and Passs As MovieApiSearchResult
 */


typealias searchApiCallback  =  (MovieApiResult) ->  Void

class MovieListSearchApiService  {
    func apiSearch ( _ searchRequest : URLRequest  ,  callback : @escaping searchApiCallback ){
        Alamofire.request(searchRequest)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    return  callback( MovieApiSearchResult(data: nil , error: response.result.error) )
                }
            callback(MovieApiSearchResult(data: response.data , error : nil ))
        }
    }
        
}
    

