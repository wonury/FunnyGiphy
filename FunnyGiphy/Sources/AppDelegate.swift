//
//  AppDelegate.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var userRepository: UserRepositoryType? = nil
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rect = UIScreen.main.bounds
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        let userRepository = UserRepository()
        loadData(repo: userRepository)

        let rootVC = FeedViewController(userRepository: userRepository)
        let nvc = UINavigationController(rootViewController: rootVC)
        window.rootViewController = nvc
        window.makeKeyAndVisible()
        
        self.window = window
        self.userRepository = userRepository
        return true
    }

    private func loadData(repo: UserRepositoryType) {
        repo.add(userType: UserType(name: "kim", address: "서울", thumbnailUrl: "https://image.ytn.co.kr/general/jpg/2020/1207/202012071325561445_t.jpg"))
    }
}
