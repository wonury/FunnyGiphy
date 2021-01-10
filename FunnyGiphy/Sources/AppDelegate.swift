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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rect = UIScreen.main.bounds
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        window.rootViewController = FeedViewController()
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}
