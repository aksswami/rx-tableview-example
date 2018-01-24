//
//  GithubRepoViewModel.swift
//  RxTableExample
//
//  Created by Amit Kumar Swami on 24/01/18.
//  Copyright © 2018 aks. All rights reserved.
//

import Foundation
import RxSwift

struct GithubRepo {
    var id: Int
    var name: String
    var fullName: String
    var isPrivate: Bool
    var url: String
    var description: String
    var createdAt: Date
    
    static func dummy() -> [GithubRepo] {
        return [ GithubRepo.init(id: 1, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 2, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 3, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 4, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 5, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 6, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
                 GithubRepo.init(id: 7, name: "Abc", fullName: "abc", isPrivate: true, url: "abc", description: "abc", createdAt: Date()),
        ]
    }
}

struct GithubRepoViewModel {
    
    var dataSource: Observable<[GithubPreviewSectionModel]>
    
    init(repos: [GithubRepo]) {
        dataSource = Observable.of(repos)
            .map { repos in
                let items = repos
                    .map { GithubRepoPreviewViewModel(repo: $0) }
                    .map { GithubRepoPreviewSectionItem.repo(presentable: $0) }
                
                return [GithubPreviewSectionModel.repo(title: "Repos", items: items)]
        }
    }
}
