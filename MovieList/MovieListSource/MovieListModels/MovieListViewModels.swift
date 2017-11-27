//
//  ViewModels.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import Foundation



//protocol BaseViewModel {
protocol BaseItemModel  {
    var title: String { get }
}



struct MovieSuggestionViewModel : BaseItemModel {
    
    let title: String
    init(_ title : String) {
        self.title = title
    }
}

/**
    MovieItemModel Base Model for ViewModels
    This model contains properties needed for display
 */


protocol MovieItemModel : BaseItemModel {
    
    var releaseData: String { get }
    var detailText: String { get }
    var imageUrl: String { get }
    
}




/**
    MovieItemViewModel Movie Item View Model
    This model is needed for converting Json Api into Model Types used for Displaying data for List Search View.
 */


struct MovieItemViewModel : MovieItemModel  {
    
    let title: String
    let releaseData: String
    let detailText: String
    let imageUrl: String
    
    init(_ item : ApiMovieItemModel) {
        detailText   = item.overview ?? ""
        imageUrl     = item.poster_path ?? ""
        releaseData  = item.release_date ?? ""
        title        = item.title ?? ""
    }
}


/**
    MovieItemViewModel Movie Item View Model
    This model is needed for Pagination of Search TableView to load next pages
 */


struct MovieListViewModel {
  
    let currentPage : Int
    let totalPages  : Int
    let movieList :  [MovieItemViewModel]
    var searchedTxt : String?
    
    init(_ item : ApiMoviesModel) {
        currentPage =  item.page
        totalPages  =  item.total_pages
        movieList     = item.results.map{ return MovieItemViewModel($0) }
    }
    
    init(_ viewModel : MovieList.Search.ViewModel) {
        currentPage =  viewModel.currentPage
        totalPages  =  viewModel.totalPages
        movieList     = viewModel.movieList
        searchedTxt  = viewModel.searchedText
    }
    
    
    init(_ newModel : MoviesDisplayList.NextPage.ViewModel) {
        searchedTxt = newModel.searchedText
        currentPage =  newModel.currentPage
        totalPages  =  newModel.totalPages
        movieList   = newModel.movieList
    }
}
