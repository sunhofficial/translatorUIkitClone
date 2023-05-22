//
//  ViewController.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/20.
//

import UIKit

final class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let translateViewController = TranslateViewController()
        translateViewController.tabBarItem = UITabBarItem(title: "번역", image: UIImage(systemName: "mic"), selectedImage: UIImage(systemName: "mic.fill"))
        let bookmarkViewController  = UIViewController()
        bookmarkViewController.tabBarItem = UITabBarItem(title: "즐겨찾기", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        viewControllers = [translateViewController, bookmarkViewController]
    }


}

