//
//  ReposViewController.swift
//  RxTableExample
//
//  Created by Amit Kumar Swami on 24/01/18.
//  Copyright © 2018 aks. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ReposViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 80
            tableView.dataSource = nil
            tableView.delegate = nil
        }
    }
    
    
    var viewModel: GithubRepoViewModel!
    private var dataSource: RxTableViewSectionedAnimatedDataSource<GithubPreviewSectionModel>?
    private var disposeBag = DisposeBag()
    
    convenience init(viewModel: GithubRepoViewModel) {
        self.init()
        
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: String(describing: MoviePreviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MoviePreviewTableViewCell.self))
        let dataSource = MasterViewController.animatedDatasource()
        self.dataSource = dataSource
        
        //        viewModel.dataSource.sub {error  in }
        viewModel.dataSource
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


extension MasterViewController {
    static func animatedDatasource() -> RxTableViewSectionedAnimatedDataSource<GithubPreviewSectionModel> {
        return RxTableViewSectionedAnimatedDataSource(
            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                           reloadAnimation: .none,
                                                           deleteAnimation: .left),
            configureCell: { (dataSource, table, indexPath, item) in
                switch dataSource[indexPath] {
                case let .repo(presentable):
                    let cell: MoviePreviewTableViewCell = table.dequeueReusableCell(withIdentifier: String(describing: MoviePreviewTableViewCell.self), for: indexPath) as! MoviePreviewTableViewCell
                    
                    cell.configure(presentable: presentable)
                    
                    return cell
                }
        })
    }
}
