//
//  AppDelegate.swift
//  TicketKitDemo
//
//  Created by Tolga İskender on 28.07.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        mainVC()
        return true
    }
    fileprivate func mainVC(){
        let vc = TicketVC.init(nibName: "TicketVC", bundle: nil)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }


}

