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
        do {
            let path = Bundle.main.path(forResource:"TestApiListJson", ofType:"json")!
            let xmlData = try Data(contentsOf : URL(fileURLWithPath: path))
            return   (try?  JSONDecoder().decode( ApiMoviesModelTest.self , from : xmlData)) ?? nil
        }
        catch let error  {
            print(error)
            return nil
        }
    }
    
    
    class func readTestMovieJsonModel () -> ApiMovieItemModelTest? {
        do {
            let path = Bundle.main.path(forResource: "TestApiMovieDetailMode", ofType:"json")!
            let xmlData = try Data(contentsOf : URL(fileURLWithPath: path))
            return   (try?  JSONDecoder().decode( ApiMovieItemModelTest.self , from : xmlData)) ?? nil
        }
        catch let error  {
            print(error)
            return nil
        }
    }
    
    
}



