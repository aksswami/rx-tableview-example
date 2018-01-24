//
//  MoviePreviewTableViewCell.swift
//  TheMovieApp
//
//  Created by Amit Kumar Swami on 19/11/17.
//  Copyright © 2017 aks. All rights reserved.
//

import UIKit
//import Kingfisher

class MoviePreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.contentMode = .scaleAspectFill
            movieImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
    }
    @IBOutlet weak var genreLabel: UILabel! {
        didSet {
            genreLabel.font = UIFont.systemFont(ofSize: 14.0)
        }
    }
    @IBOutlet weak var releaseDateLabel: UILabel! {
        didSet {
            releaseDateLabel.font = UIFont.systemFont(ofSize: 14.0)
        }
    }
    @IBOutlet weak var overviewLabel: UILabel! {
        didSet {
            overviewLabel.numberOfLines = 0
            overviewLabel.font = UIFont.systemFont(ofSize: 14.0)
            overviewLabel.textColor = .darkGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        movieImageView.image = nil
        titleLabel.text = nil
        genreLabel.text = nil
        releaseDateLabel.text = nil
        overviewLabel.text = nil
    }
    
    func configure(presentable: MoviePreviewCellPresentable) {
//        movieImageView.kf.setImage(with: presentable.imageURL, placeholder: #imageLiteral(resourceName: "placeholder"))
        titleLabel.text = presentable.title
        genreLabel.text = presentable.genre
        releaseDateLabel.text = presentable.releaseDate
        overviewLabel.text = presentable.overview
    }
}
