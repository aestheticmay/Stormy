//
//  AppDelegate.swift
//  Stormy
//
//  Created by Майя Калицева on 08.09.2022.
//

import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        
        // MARK: - Public Properties
        
        var window:UIWindow?

        // MARK: - Public Methods
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            window?.makeKeyAndVisible()
            
            return true
        }
    }
}

