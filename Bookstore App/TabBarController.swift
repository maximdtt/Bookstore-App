//
//  TabBarController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupTabBar()
    }
    
    private func setupViewControllers() {
        
        viewControllers = [
            setupNavigationController(rootViewController: HomeViewController(), title: "Home", image: UIImage(systemName: "house.fill") ?? UIImage.add),
            setupNavigationController(rootViewController: CategoriesViewController(), title: "Categories", image: UIImage(systemName: "square.grid.2x2") ?? UIImage.add),
            setupNavigationController(rootViewController: LikesViewController(), title: "Likes", image: UIImage(systemName: "heart.fill") ?? UIImage.add),
            setupNavigationController(rootViewController: AccountViewController(), title: "Account", image: UIImage(systemName: "person.crop.square.fill") ?? UIImage.add)
        ]
        
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
            
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image

        return navigationController
    }
    
    private func setupTabBar() {
        
        // TODO:
        let appearence = UITabBarAppearance()
        view.tintColor = .black
        tabBar.scrollEdgeAppearance = appearence
        

        
    }
    
}
