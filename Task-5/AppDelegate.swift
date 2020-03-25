//
//  AppDelegate.swift
//  Task-5
//
//  Created by Gluschenko Andrey on 23.03.2020.
//  Copyright © 2020 Gluschenko Andrey. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true
        return true
    }

}

