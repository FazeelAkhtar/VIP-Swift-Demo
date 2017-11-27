//
//  MovieApiWorker.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation


/**
    MovieApiWorkerProtocol Protocol
    This Protocol is needed for Getting Api Json work done from Search Api with Given Request
    and it will return result call back where its called with Response
 */

protocol MovieApiWorkerProtocol
{
    func getDataFromApi (_ withRequest: URLRequest , callBack : @escaping searchApiCallback )
}



class MovieApiWorker : MovieApiWorkerProtocol {
    
    private lazy var searchApiService : MovieListSearchApiService  = MovieListSearchApiService()

    /**
     getDataFromApi
     This func is needed for execute Api Search Service , by passing search requests and getting result as callbakc
     */
    
    func getDataFromApi (_ withRequest: URLRequest , callBack : @escaping searchApiCallback ){
        searchApiService.apiSearch(withRequest, callback: callBack)
    }

}
