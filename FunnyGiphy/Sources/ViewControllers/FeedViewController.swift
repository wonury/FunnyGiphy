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
    
    private let userRepository: UserRepositoryType
        
    init(userRepository: UserRepositoryType) {
        self.userRepository = userRepository
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpDummyData()
    }
    
    private func setUpDummyData() {
        items.forEach({ userRepository.add(userType: $0) })
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
        return userRepository.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell", for: indexPath) as! FeedTableViewCell
        if let user = userRepository.user(indexRow: indexPath.row) {
            cell.configure(user: user)
        }
        return cell
    }
}

extension FeedViewController: UITableViewDelegate { }
