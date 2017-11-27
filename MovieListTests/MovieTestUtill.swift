//
//  MovieTestUtill.swift
//  MovieListTests
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import Foundation


class MovieTestUtill {
 
    class func readTestApiJsonModel () -> ApiMoviesModelTest? {
        var resModel : ApiMoviesModelTest? = nil
        do {
            if let filePath = Bundle.main.url(forResource: "TestApiListJson", withExtension: "json"){
                let xmlData = try Data(contentsOf :  filePath)
                resModel =    try  JSONDecoder().decode( ApiMoviesModelTest.self , from : xmlData)
            }
        }
        catch let error  {
            print(error)
        }
       return resModel
    }
    
    
    class func readTestMovieJsonModel () -> ApiMovieItemModelTest? {
        do {
            if let filePath = Bundle.main.url(forResource: "TestApiMovieDetailMode", withExtension: "json"){
                let data = try Data(contentsOf : filePath)
                return   (try?  JSONDecoder().decode( ApiMovieItemModelTest.self , from : data)) ?? nil
            }
        }
        catch let error  {
            print(error)
            return nil
        }
        return nil
    }
    
    
}



