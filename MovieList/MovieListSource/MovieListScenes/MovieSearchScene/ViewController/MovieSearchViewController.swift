//
//  MovieSearchViewController.swift
//  TestApp
//
//  Created by Dev on 11/23/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit
import Cartography


class MovieSearchViewController   : BaseViewController < MovieSuggestionViewModel , MovieSearchCell > ,  UISearchBarDelegate {

    var output: MovieSearchProtocol?
    var router: MovieSearchRouter?
    var searchedQuery : String?
    var isAlreadySearching : Bool = false
    

    
    private lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        return searchBar
    }()
    
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tableData = []
        
    }
    
    
    init( with  tableData :  [Any]) {
        super.init()
        self.tableData = tableData
        
    }
    
    
    override  func viewDidLoad() {
        
        super.viewDidLoad()
        self.searchBar.text = ""
        MovieSearchViewConfigurator.sharedInstance.configure(viewController: self) //configure output/input
    }
    
    
 

 
    
    
   override   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.tableData.count >= indexPath.row else { return }
        if let searchSuggestion  = self.tableData[indexPath.row] as? MovieSuggestionViewModel {
            searchedQuery  = nil
            self.executeSearchQuery(request: MovieList.Search.Request(queryText: searchSuggestion.title , page: 0) )
        }
    }
    
    
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text  else {return }
        guard !isAlreadySearching else { return }
        searchedQuery  = text
        self.executeSearchQuery(request: MovieList.Search.Request(queryText: text, page: 0) )
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.executeSuggestionRequest(request: MovieList.Suggestion.Request(type: .getAll) )
        return true
    }
    
}



