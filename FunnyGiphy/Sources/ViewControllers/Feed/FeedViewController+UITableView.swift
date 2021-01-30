//
//  FeedViewController+UITableView.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/30.
//

import UIKit

extension FeedViewController: UITableViewDataSource & UITableViewDelegate {
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
