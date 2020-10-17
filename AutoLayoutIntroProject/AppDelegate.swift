//
//  AppDelegate.swift
//  AutoLayoutIntroProject
//
//  Created by Joseph Bouhanef on 2020-10-09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //this is how we build out our app in code
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        swipingController.view.backgroundColor = .purple
        window?.rootViewController = swipingController
        
        return true
    }


}

