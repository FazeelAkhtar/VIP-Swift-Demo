//
//  MovieUrlManagers.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation



/**
 MovieSearchURLManager Enum
 This Enum is needed for generic multiple type of Serers needed and need URL management for different Servers
 */



public  enum MovieSearchURLManager {
    
    case Image (imagePath : String)
    case Api   ( queryText : String , page : Int?)
    

    
    /**
     getUrl : Pass Server type to get specific urls for item
     */

    func getUrl( serverType : ServerType  = .live ) -> String{
        switch self {
            case .Image( let imagePath):
                return serverType.getServerUrl(with: self) + imagePath
            case .Api(let  queryTxt  ,  let page) :
                return self.getSearchQuery(base: serverType.getServerUrl(with: self)
                    , queryText: queryTxt
                    , page: page)
        }
        
    }
    
    private func  getSearchQuery ( base : String , queryText : String , page : Int?) -> String {
        if let page = page{
            return "\(base)&query=\(queryText)&page=\(String(page))"
        }else {
            return "\(base)&query=\(queryText)"
        }
        
    }
        
}

public  enum ServerType {
    
    case live
    case dev //FeedOne
    case local
    
    func getServerUrl (with type : MovieSearchURLManager) -> String {
        switch  type {
        case .Api:      return self.getApiServer() + self.getApiKey()
        case .Image:    return self.getImageServer()
        }
    }
    
   private func getApiKey() -> String {
        switch self {
        case .live:     return "2696829a81b1b5827d515ff121700838"
        case .dev:      return ""   // Any other key for dev server
        case .local:    return ""  // Any other key for local server
        }
    }
    

}

extension ServerType {
    
    
    
    private  func getImageServer() -> String {
        switch self {
        case .live:     return "http://image.tmdb.org/t/p/w92"
        case .dev:      return ""   // Any other image base url for dev server
        case .local:    return ""
        }
    }
    
    private  func getApiServer() -> String {
        switch self {
        case .live:     return "http://api.themoviedb.org/3/search/movie?api_key="
        case .dev:      return ""  // Any other Api base url for dev server
        case .local:    return ""
        }
    }
}

