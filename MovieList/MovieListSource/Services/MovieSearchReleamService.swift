//
//  MovieSearchReleamService.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation
import RealmSwift


/**
    MovieSearchReleamService Protocol
    This Class is lower level implementation of Releam DB Object Mapping , which is used to presist objs and Search suggestion in DB
 */

class MovieSearchReleamService: MovieSuggestionStoreProtocol {
    
    let EMPTY_ARRAY = 0

    func fetchAllItems(completionHandler:  MovieStoreAllItemWithErrorCallBack) {
        let realm = try! Realm()
        let itemEntities = realm.objects(RealmMovieSearchItem.self)
        if itemEntities.count==EMPTY_ARRAY{
            completionHandler([], nil)
        }
        else{
            completionHandler(itemEntities.map{$0.toItem()}, nil)
        }
    }
    
    func fetchItem(id: String , completionHandler: MovieStoreItemCallBack){
        let itemsArray = fetchItemInRealm(id: id)
        if itemsArray.count == EMPTY_ARRAY{
            completionHandler(nil, MovieSuggestionStoreError.CannotFetch("The id selected doesn't exist in Realm"))
        }
        else{
            completionHandler(itemsArray.first?.toItem(), nil)
        }
    }
    
    func deleteItem(id: String, completionHandler: MovieStoreErrorCallBack ){
       
        let itemsArray = fetchItemInRealm(id: id)
        if itemsArray.count == EMPTY_ARRAY{
            completionHandler(MovieSuggestionStoreError.CannotDelete("The id selected doesn't exist in Realm"))
        }
        else{
            let realm = try! Realm()
            do{
                try realm.write( {
                    realm.delete(itemsArray.first!)
                    completionHandler(nil)
                })
            }
            catch{
                completionHandler(MovieSuggestionStoreError.CannotDelete("The object couldn't be deleted"))
            }
        }
    }
    
    func createItem(item: MovieSuggestionViewModel,  completionHandler: MovieStoreErrorCallBack ) {
        createItemInRealm(item: item.title , isUpdate: false, completionHandler: {(error) in
            completionHandler(error)
        })

    }
    
    func updateItem(item: MovieSuggestionViewModel,  completionHandler:  MovieStoreErrorCallBack){
            createItemInRealm(item: item.title, isUpdate: false ,completionHandler: {(error) in
                completionHandler(error)
            })
    }
    
}


extension MovieSearchReleamService {
    
    
    private func createItemInRealm(item: String , isUpdate: Bool, completionHandler: MovieStoreErrorCallBack ){
        let realm = try! Realm()
        let realmItem = RealmMovieSearchItem()
        realmItem.id = item
        do{
            try realm.write( {
                realm.add(realmItem, update: true)
                completionHandler(nil)
            })
        }
        catch{
            completionHandler(MovieSuggestionStoreError.CannotCreate("The object couldn't be created"))
        }
    }
    
    
    private func fetchItemInRealm(id: String) -> [RealmMovieSearchItem]{
        let realm = try! Realm()
        let itemsArray = realm.objects(RealmMovieSearchItem.self).filter("id = \(id)")
        return itemsArray.map{$0 as RealmMovieSearchItem}
    }

}




extension RealmMovieSearchItem {
    func toItem() -> MovieSuggestionViewModel {
        return MovieSuggestionViewModel(id)
    }
}


