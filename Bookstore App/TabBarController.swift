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
                return LikesViewController(viewModel: LikesViewModel())
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
        
        var image: UIImage {
            switch self {
            case .home:
                return UIImage(systemName: "house.fill") ?? UIImage.add
            case .categories:
                return UIImage(systemName: "square.grid.2x2") ?? UIImage.add
            case .likes:
                return UIImage(systemName: "heart.fill") ?? UIImage.add
            case .account:
                return UIImage(systemName: "person.crop.square.fill") ?? UIImage.add
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
            setupNavigationController(rootViewController: Controllers.home.controller, title: Controllers.home.title, image: Controllers.home.image),
            setupNavigationController(rootViewController: Controllers.categories.controller, title: Controllers.categories.title, image: Controllers.categories.image),
            setupNavigationController(rootViewController: Controllers.likes.controller, title: Controllers.likes.title, image: Controllers.likes.image),
            setupNavigationController(rootViewController: Controllers.account.controller, title: Controllers.account.title, image: Controllers.account.image)
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
