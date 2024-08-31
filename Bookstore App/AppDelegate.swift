//
//  AppDelegate.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
        
    }()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// Не забывайте про выравнивание кода, быстрая комбинация клавиш - "control + i"
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = WelcomeViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                let viewController = LoginViewController()
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            }
        }

        return true
    }
}
