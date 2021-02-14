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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController(userType: UserType(name: "kim", address: "서울시", thumbnailUrl: "https://canary.contestimg.wish.com/api/webimage/5c00dfcd4f16317ea1468191-large.jpg?cache_buster=dc87a0da75df8260586095d5254fdf63"))
        //        present(vc, animated: true)

        vc.title = "상세 화면"

        // navigation controller
        let nvc = UINavigationController(rootViewController: vc)
        navigationController?.pushViewController(vc, animated: true)
        nvc.modalPresentationStyle = .fullScreen
    }
}
