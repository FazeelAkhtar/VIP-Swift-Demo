//
//  MovieItemDetailCell.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit
import Kingfisher


/**
    BaseMovieItemCell   :  Dynamic Cell
    @param :   Pass Dynamic Cell Data model
 
 */


class BaseMovieItemCell <T : BaseItemModel > : UITableViewCell , ConfigurableCell  {
    var mItem : T?
    
    func configure(_ model: T , at indexPath: IndexPath) {
        mItem = model
    }
    
}


class MovieSearchCell : BaseMovieItemCell<MovieSuggestionViewModel>   {

    @IBOutlet weak var mMovieName            : UILabel!
    
    override  func configure(_ model: T , at indexPath: IndexPath) {
        mItem = model
        mMovieName.text = model.mTitle
    }
    
}



class MoveDetailItemCell  : BaseMovieItemCell <MovieItemViewModel> {
    
    
    @IBOutlet weak var mAuthorAvatar         : UIImageView!
    @IBOutlet weak var mMovieName            : UILabel!
    @IBOutlet weak var mReleaseDate          : UILabel!
    @IBOutlet weak var mPlainTitle           : UILabel!
    
    
    override func configure(_ model: T , at indexPath: IndexPath) {
        mItem = model
        mMovieName.text         =   model.mTitle
        mReleaseDate.text       =   model.mReleaseData
        mPlainTitle.text        =    model.mDetailText
        updateImage()
    }
    
}

extension MoveDetailItemCell {
    
    /**
        updateImage : update image for cell
     */

    
    func updateImage(){
        if let path = self.mItem?.mImageUrl {
            let completePath = MovieSearchURLManager.Image(imagePath: path).getUrl()
            let url = URL(string: completePath)
            self.mAuthorAvatar.kf.setImage(with: url)
        }
    }
}

