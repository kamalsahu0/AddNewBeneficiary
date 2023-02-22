//
//  AppDelegate.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit
//import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let navigationController = UINavigationController(rootViewController: MainViewController())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .secondarySystemBackground
        window?.rootViewController = navigationController
        
        return true
    }
    
}

