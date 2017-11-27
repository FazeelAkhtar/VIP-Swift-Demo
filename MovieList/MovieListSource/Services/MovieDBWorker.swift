//
//  MovieDBWorker.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation


//SearchItemViewModel



/**
    Typealias is used for DB worker callback.
 */


typealias MovieStoreAllItemWithErrorCallBack =  (_ itemArray:[MovieSuggestionViewModel] , _ error: MovieSuggestionStoreError?)
    -> Void
typealias MovieStoreAllItemCallBack =  (_ itemArray:[MovieSuggestionViewModel]) -> Void
typealias MovieStoreItemCallBack  = (_ item:MovieSuggestionViewModel?, _ error: MovieSuggestionStoreError?) -> Void
typealias MovieStoreErrorCallBack  = (_ error: MovieSuggestionStoreError?) -> Void



/**
    MovieSuggestionStoreProtocol Protocol
    This Protocol is needed for more abstract DB queries to get data from low level Databse . which can be pluged and changed when needed
 */


protocol MovieSuggestionStoreProtocol{
    
    func fetchAllItems(completionHandler:  MovieStoreAllItemWithErrorCallBack)
    func fetchItem(id: String , completionHandler: MovieStoreItemCallBack)
    func deleteItem(id: String, completionHandler: MovieStoreErrorCallBack )
    func createItem(item: MovieSuggestionViewModel,  completionHandler: MovieStoreErrorCallBack )
    func updateItem(item: MovieSuggestionViewModel,  completionHandler:  MovieStoreErrorCallBack)
}


enum MovieSuggestionStoreError: Error{
    case CannotFetch(String)
    case CannotDelete(String)
    case CannotCreate(String)
    case CannotUpdate(String)
}



/**
    MovieDBWorker
    This Class is needed for more implement lower level queries to get data from low level Databse . which can be pluged and changed when needed
 */

class MovieDBWorker {
    
    var itemStore: MovieSuggestionStoreProtocol
    init(itemStore: MovieSuggestionStoreProtocol) {
        self.itemStore = itemStore
    }
    
  private  func fetchAllItems(completionHandler: MovieStoreAllItemWithErrorCallBack){
        itemStore.fetchAllItems(completionHandler: {itemsArray, error in
            if error != nil {
                completionHandler([] , nil )
            }
            else{
                completionHandler(itemsArray , nil )
            }
        })
    }
    
  private  func fetchItem(id: String , completionHandler: MovieStoreItemCallBack ){
        itemStore.fetchItem(id: id, completionHandler: {(item, error) in
            completionHandler(item, error)
        })
    }
    
   private func deleteItem(id: String, completionHandler: MovieStoreErrorCallBack ){
        itemStore.deleteItem(id: id, completionHandler: {(error) in
            completionHandler(error)
        })
    }
    
  private  func createItem(item: MovieSuggestionViewModel, completionHandler: MovieStoreErrorCallBack ){
        itemStore.createItem(item: item, completionHandler: {(error) in
            completionHandler(error)
        })
    }
    
   private func updateItem(item: MovieSuggestionViewModel, completionHandler: MovieStoreErrorCallBack ){
        itemStore.updateItem(item: item, completionHandler:{(error) in
            completionHandler(error)
        })
    }
    
}


extension MovieDBWorker {
 
    func executeRequest (request : MovieList.Suggestion.Request  , callBack : MovieStoreAllItemWithErrorCallBack){
        switch request.type {
            case .add(let name ):
                self.createItem(item: MovieSuggestionViewModel(name)) { error in
                    guard  error != nil else { return callBack([] , error) }
                    callBack( [] , nil )
                }
                break
            case .getAll :
                self.fetchAllItems(completionHandler: callBack) ; break
        }
    }
}
