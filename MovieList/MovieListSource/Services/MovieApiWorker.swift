//
//  MovieApiWorker.swift
//  TestApp
//
//  Created by Dev on 11/24/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation



protocol MovieApiWorkerProtocol
{
    func getDataFromApi (_ withRequest: URLRequest , callBack : @escaping searchApiCallback )
}


class MovieApiWorker : MovieApiWorkerProtocol {
    
    private lazy var searchApiService : MovieListSearchApiService  = MovieListSearchApiService()

    func getDataFromApi (_ withRequest: URLRequest , callBack : @escaping searchApiCallback ){
        searchApiService.apiSearch(withRequest, callback: callBack)
    }

}
