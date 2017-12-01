//
//  FeedItemWorker.swift
//  test
//
//  Created by Fazeel on 10/6/17.
//  Copyright (c) 2017 Fazeel. All rights reserved.
//

import UIKit





protocol MovieSearchWorker {
    func getSearchedMovie(_ request : MovieList.Search.Request  , callBack : @escaping searchApiCallback)
}


class MovieSearchApiWorker: MovieSearchWorker {
    
    
    /**
        getSearchedMovie   :   request to get Searched api and get results
     */
    
    func getSearchedMovie(_ request : MovieList.Search.Request , callBack :  @escaping searchApiCallback ){
        let apiWorker = MovieApiWorker()
        if let request = getSearchedRequest(request: request) {
            apiWorker.getDataFromApi(request, callBack: callBack)
        }
    }
}



extension MovieSearchApiWorker {
    
    /**
        getSearchedRequest   :   worker for APi Search and get URL
     
     */
    
     func getSearchedRequest( request : MovieList.Search.Request ) -> URLRequest? {
        let page = request.page > 0 ? request.page  :  nil
        if  let urlString = MovieSearchURLManager.Api(queryText: request.queryText, page: page).getUrl().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            if let url = URL(string: urlString){
                return URLRequest(url: url)
            }
        }
        return nil
    }
}



