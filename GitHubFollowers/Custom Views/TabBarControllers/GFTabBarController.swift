//
//  GFTabBarController.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 24/02/2023.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        self.viewControllers = [createSearchNavigationController(), createFavouritesNavigationController()]
        
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC        = SearchVC()
        searchVC.title      = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavouritesNavigationController() -> UINavigationController {
        let favouritesListVC        = FavouritesListVC()
        favouritesListVC.title      = "Favourites"
        favouritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouritesListVC)
    }

}
