//
//  TabBarController.swift
//  Bookstore App
//
//  Created by Maksims Šalajevs on 03/08/2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    /// Предлагаю использовать енамы. Это страхует от ошибки в наименовании контроллера, и если у вас добавится еще контроллер, свитч сам вам скажет что нужно добавть еще один кейс
    enum Controllers: CaseIterable {
        case home
        case categories
        case likes
        case account

        var controller: UIViewController {
            switch self {
                
            case .home:
                return HomeViewController()
            case .categories:
                return CategoriesViewController()
            case .likes:
                return LikesViewController()
            case .account:
                return AccountViewController()
            }
        }

        var title: String {
            switch self {

            case .home:
                return "Home"
            case .categories:
                return "Categories"
            case .likes:
                return "Likes"
            case .account:
                return "Account"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupTabBar()
    }
    
    private func setupViewControllers() {
        /// с картинками можно сделать тоже самое как с контроллером и тайтлом
        /// Либо завести отдельный енам который в кейсах будет возвращать стринг с названием картинки и использовать его сырое значение
        viewControllers = [
            setupNavigationController(rootViewController: Controllers.home.controller, title: Controllers.home.title, image: UIImage(systemName: "house.fill") ?? UIImage.add),
            setupNavigationController(rootViewController: Controllers.categories.controller, title: Controllers.categories.title, image: UIImage(systemName: "square.grid.2x2") ?? UIImage.add),
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
