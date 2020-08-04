//
//  AppDelegate.swift
//  Todoey
//
//  Created by Abdualziz Aljuaid on 25/07/2020.
//  Copyright © 2020 Abdualziz Aljuaid. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
//
//        do{
//
//        let realm = try Realm()
//
//        } catch {
//            print("Error installing Realm,")
//        }
        return true
    }

}

