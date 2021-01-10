//
//  FeedViewController.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/10.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let items: [UserType] = [
        UserType(name: "Leanne Graham",
                 address: "Sincere@april.biz",
                 thumbnailUrl: "https://via.placeholder.com/150/92c952"),
        UserType(name: "Ervin Howell",
                 address: "Shanna@melissa.tv",
                 thumbnailUrl: "https://via.placeholder.com/150/771796"),
        UserType(name: "Clementine Bauch",
                 address: "Nathan@yesenia.net",
                 thumbnailUrl: "https://via.placeholder.com/150/24f355"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedViewCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}


extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell", for: indexPath) as! FeedTableViewCell
        cell.configure(user: items[indexPath.row])
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
