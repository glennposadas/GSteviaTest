//
//  AppDelegate.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        UINavigationBar.appearance().tintColor = GSteviaColor.color.blueTintColor
        UINavigationBar.appearance().barTintColor = GSteviaColor.color.navigationBarGrayColor
        
        let homeTVC = HomeTableViewController()
        let rootNavigationController = UINavigationController(rootViewController: homeTVC)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        
        return true
    }
}

