//
//  AppDelegate.swift
//  Spotify
//
//  Created by Decagon on 19/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = navigationController
        return true
    }


}

