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
        window.rootViewController = FeedViewController(userRepository: userRepository)
        window.makeKeyAndVisible()
        
        self.window = window
        self.userRepository = userRepository
        return true
    }
}
