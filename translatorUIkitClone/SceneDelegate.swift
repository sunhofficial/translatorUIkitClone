//
//  SceneDelegate.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabbarController()
        window?.tintColor = .mainTintColor
        window?.makeKeyAndVisible()
    }
    
}

