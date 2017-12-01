//
//  MovieSearchViewController.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit
import Cartography


class MovieSearchViewController   : BaseViewController < MovieSuggestionViewModel , MovieSearchCell > ,  UISearchBarDelegate {

    
    /**
        output :  Display and update protocol
     */

    
    var mOutput: MovieSearchProtocol?

    
    /**
        router :  For View Navigation
     */

    
    var mRouter: MovieSearchRouter?
    
    /**
        searchedQuery :  searched Query
     */
    
    var mSearchedQuery : String?
    
    
    /**
        isAlreadySearching :  to stop multiple searching if in progress
     */
    
    var mIsAlreadySearching : Bool = false
    

    
    private lazy var mSearchBar : UISearchBar = {
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
        self.mTableData = []
        
    }
    
    
    /**
        tableData    :   Passed data by init if needed
     */
    
    init( with  tableData :  [Any]) {
        super.init()
        self.mTableData = tableData
    }
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        self.mSearchBar.text = ""
        MovieSearchViewConfigurator.sharedInstance.configure(viewController: self) //configure output/input
    }
    
    
 

    /**
     
     didSelectRowAt    :   load saved query search
     
     */
    
   override   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.mTableData.count >= indexPath.row else { return }
        if let searchSuggestion  = self.mTableData[indexPath.row] as? MovieSuggestionViewModel {
            mSearchedQuery  = nil
            self.executeSearchQuery(request: MovieList.Search.Request(queryText: searchSuggestion.mTitle , page: 0) )
        }
    }
    
    
    /**
     
        searchBarSearchButtonClicked    :   search bar query search button pressed
     
     */
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text  else {return }
        guard !mIsAlreadySearching else { return }
        mSearchedQuery  = text
        self.executeSearchQuery(request: MovieList.Search.Request(queryText: text, page: 0) )
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.executeSuggestionRequest(request: MovieList.Suggestion.Request(type: .getAll) )
        return true
    }
    
}



