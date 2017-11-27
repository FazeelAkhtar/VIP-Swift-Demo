//
//  MovieItemDetailCell.swift
//  TestApp
//
//  Created by Dev on 11/27/17.
//  Copyright © 2017 Fazeel. All rights reserved.
//

import UIKit
import Kingfisher

class BaseMovieItemCell <T : BaseItemModel > : UITableViewCell , ConfigurableCell  {
    var item : T?
    
    func configure(_ model: T , at indexPath: IndexPath) {
        self.item = model
    }
    
}


class MovieSearchCell : BaseMovieItemCell<MovieSuggestionViewModel>   {

    @IBOutlet weak var movieName            : UILabel!
    
    override  func configure(_ model: T , at indexPath: IndexPath) {
        self.item = model
        movieName.text = self.item?.title
    }
    
}



class MoveDetailItemCell  : BaseMovieItemCell <MovieItemViewModel> {
    
    
    @IBOutlet weak var authorAvatar         : UIImageView!
    @IBOutlet weak var movieName            : UILabel!
    @IBOutlet weak var releaseData          : UILabel!
    @IBOutlet weak var plainTitle           : UILabel!
    
    
    override func configure(_ model: T , at indexPath: IndexPath) {
        self.item = model
        self.movieName.text         =   model.title
        self.releaseData.text       =   model.releaseData
        self.plainTitle.text        =    model.detailText
        updateImage()
    }
    
}

extension MoveDetailItemCell {
    
    func updateImage(){
        if let path = self.item?.imageUrl {
            let completePath = MovieSearchURLManager.Image(imagePath: path).getUrl()
            let url = URL(string: completePath)
            self.authorAvatar.kf.setImage(with: url)
        }
    }
}

