//
//  AppDelegate.swift
//  TableView
//
//  Created by Danil Goncharov on 15.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationContoller = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = navigationContoller
        window?.makeKeyAndVisible()
        
        return true
    }
}
