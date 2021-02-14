//
//  FeedViewController.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/10.
//

import UIKit
import SnapKit

final class FeedViewController: BaseViewController {
    
    internal let userRepository: UserRepositoryType

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedViewCell")
        tableView.rowHeight = 72
        return tableView
    }()
    
    init(userRepository: UserRepositoryType) {
        self.userRepository = userRepository

        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "목록"
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}
