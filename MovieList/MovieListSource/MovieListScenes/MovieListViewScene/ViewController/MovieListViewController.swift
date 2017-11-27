//
//  DetailTableView.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Cartography




class MovieListViewController : BaseViewController < MovieItemViewModel , MoveDetailItemCell >  {

    var output: MovieListViewProtocol?
    var router: MovieListViewRouter?
    
    var ViewModel : MovieListViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.ViewModel = nil
    }
    
    
     init( with  viewModel  : MovieListViewModel ) {
        super.init()
        self.ViewModel = viewModel
        tableData = viewModel.movieList
    }
    
    
    
    
   override  func viewDidLoad() {
        
        super.viewDidLoad()
        addFooterLoadingAnimation()
        MovieListViewConfigurator.sharedInstance.configure(viewController: self)
    }

    
    
   override  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    
//        let lastSectionIndex = 0
//        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
//        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
//
//        }
        updateFooterView(tableView , indexPath: indexPath)
    }
    
    
}





extension MovieListViewController {
    
   private var isPageAvailble : Bool {
        if let viewModel = self.ViewModel {
            return viewModel.currentPage < viewModel.totalPages
        }
        return  false
    }
    
    private func updateFooterView (_ tableView: UITableView , indexPath: IndexPath)  {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if  indexPath.row == lastRowIndex {
            tableView.tableFooterView?.isHidden  = !isPageAvailble
            
            if let queryTxt = ViewModel?.searchedTxt , let page =  ViewModel?.currentPage  {
                guard page <= ViewModel?.totalPages ?? 0  else { return }
                let req = MoviesDisplayList.NextPage.Request(queryText:  queryTxt , page: page+1)
                self.searchNextPageMovieItems(request:  req)
            }
        }
    }
    
}






