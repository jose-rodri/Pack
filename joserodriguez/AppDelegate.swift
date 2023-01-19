//
//  AppDelegate.swift
//  joserodriguez
//
//  Created by WHIZ on 23/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("save ==>\(RemoteLib.shared.settingsManager.save)")
        print("textName ==>\(RemoteLib.shared.settingsManager.name)")
        print("textPaternalSurname ==>\(RemoteLib.shared.settingsManager.surname)")
        print("texttMotherLastName ==>\(RemoteLib.shared.settingsManager.lastName)")
        print("texGender ==>\(RemoteLib.shared.settingsManager.gender)")
        print("textBirth ==>\(RemoteLib.shared.settingsManager.birth)")
        
        let navController = UINavigationController(rootViewController: WelcomeRouter.createModule())
       // navController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
     
      
        
        return true
    }



}

