//
//  AnimatableMovieSectionViewModel.swift
//  TheMovieApp
//
//  Created by Amit Kumar Swami on 19/11/17.
//  Copyright © 2017 aks. All rights reserved.
//

import Foundation
import RxDataSources


// Table section items
enum GithubRepoPreviewSectionItem {
    case repo(presentable: MoviePreviewCellPresentable)
}

extension GithubRepoPreviewSectionItem: IdentifiableType, Equatable {
    typealias Identity = Int
    
    var identity: Identity {
        switch self {
        case let .repo(presentable):
            return presentable.id //Something which can define uniqueness
        }
    }
}

func ==(lhs: GithubRepoPreviewSectionItem, rhs: GithubRepoPreviewSectionItem) -> Bool {
    return lhs.identity == rhs.identity
}


// Table section
enum GithubPreviewSectionModel {
    case repo(title: String, items: [GithubRepoPreviewSectionItem])
}

extension GithubPreviewSectionModel: AnimatableSectionModelType {
    typealias Item = GithubRepoPreviewSectionItem
    
    var items: [Item] {
        switch self {
        case let .repo(title: _, items: items):
            
            return items.map { $0 }
        }
    }
    
    var identity: String {
        switch self {
        case let .repo(title: title, items: _):
            
            return title
        }
    }
    
    init(original: GithubPreviewSectionModel, items: [Item]) {
        switch original {
        case let .repo(title: title, items: _):
            self = .repo(title: title, items: items)
        }
    }
}
