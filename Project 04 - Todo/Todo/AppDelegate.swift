//
//  AppDelegate.swift
//  Todo
//
//  Copyright © 2016 YiGu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    #if AUTOMATION_TEST
        UIView.setAnimationsEnabled(false)
    #endif
    // Override point for customization after application launch.
    return true
  }
}

