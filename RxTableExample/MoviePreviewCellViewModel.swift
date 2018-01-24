//
//  MoviePreviewCellViewModel.swift
//  TheMovieApp
//
//  Created by Amit Kumar Swami on 19/11/17.
//  Copyright © 2017 aks. All rights reserved.
//

import Foundation
//import RealmSwift

protocol MoviePreviewCellPresentable {
    var id: Int { get }  // For uniqueness check
    var imageURL: URL? { get }
    var title: String { get }
    var genre: String { get }
    var releaseDate: String { get }
    var overview: String { get }
}

struct GithubRepoPreviewViewModel: MoviePreviewCellPresentable {
    var id: Int
    var imageURL: URL?
    var title: String
    var genre: String
    var releaseDate: String
    var overview: String
    
    init(repo: GithubRepo) {
        self.id = repo.id
        self.imageURL = URL(string: repo.url)
        self.title = repo.name
        self.releaseDate = "\(repo.createdAt)"
        self.overview = repo.description
        self.genre = repo.fullName
    }
}
