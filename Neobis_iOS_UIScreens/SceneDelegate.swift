//
//  SceneDelegate.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 24/1/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let book = UINavigationController(rootViewController: BookViewController())
        book.title = "book"
        
        let trip = TripViewController()
        trip.title = "trip"
        
        let crypto = UINavigationController(rootViewController: CryptoViewController())
        crypto.title = "crypto"
        
        let finance = FinanceViewController()
        finance.title = "finance"
        
        let weather = WeatherViewController()
        weather.title = "weather"
        
        book.tabBarItem = UITabBarItem(title: "Book", image: UIImage(named: "book"), selectedImage: nil)
        
        trip.tabBarItem = UITabBarItem(title: "Trip", image: UIImage(named: "world"), selectedImage: nil)
        
        crypto.tabBarItem = UITabBarItem(title: "Crypto", image: UIImage(named: "crypto"), selectedImage: nil)
        
        finance.tabBarItem = UITabBarItem(title: "Finance", image: UIImage(named: "hand"), selectedImage: nil)
        
        weather.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(named: "cloudy"), selectedImage: nil)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [book, trip, crypto, finance, weather]
        tabBarController.delegate = self
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

