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
    var mTitle: String { get }
}



struct MovieSuggestionViewModel : BaseItemModel {
    
    let mTitle: String
    init(_ title : String) {
        self.mTitle = title
    }
}

/**
    MovieItemModel Base Model for ViewModels
    This model contains properties needed for display for search List Screen
 */


protocol MovieItemModel : BaseItemModel {
    
    var mReleaseData: String { get }
    var mDetailText: String { get }
    var mImageUrl: String { get }
    
}




/**
    MovieItemViewModel Movie Item View Model
    This model is needed for converting Json Api into Model Types used for Displaying data for List Search View.
 */


struct MovieItemViewModel : MovieItemModel  {
    
    let mTitle: String
    let mReleaseData: String
    let mDetailText: String
    let mImageUrl: String
    
    init(_ item : ApiMovieItemModel) {
        mDetailText   = item.overview ?? ""
        mImageUrl     = item.poster_path ?? ""
        mReleaseData  = item.release_date ?? ""
        mTitle        = item.title ?? ""
    }
}


/**
    MovieItemViewModel Movie Item View Model
    This model is needed for Pagination of Search TableView to load next pages
    Contains Current Page , Next page and search Query String
 
 */


struct MovieListViewModel {
  
    let mCurrentPage : Int
    let mTotalPages  : Int
    let mMovieList :  [MovieItemViewModel]
    var mSearchedTxt : String?
    
    init(_ item : ApiMoviesModel) {
        mCurrentPage =  item.page
        mTotalPages  =  item.total_pages
        mMovieList     = item.results.map{ return MovieItemViewModel($0) }
    }
    
    init(_ viewModel : MovieList.Search.ViewModel) {
        mCurrentPage =  viewModel.currentPage
        mTotalPages  =  viewModel.totalPages
        mMovieList     = viewModel.movieList
        mSearchedTxt  = viewModel.searchedText
    }
    
    
    init(_ newModel : MoviesDisplayList.NextPage.ViewModel) {
        mSearchedTxt = newModel.searchedText
        mCurrentPage =  newModel.currentPage
        mTotalPages  =  newModel.totalPages
        mMovieList   = newModel.movieList
    }
}
