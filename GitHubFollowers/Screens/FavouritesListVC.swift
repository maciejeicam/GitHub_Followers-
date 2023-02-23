//
//  FavouritesListVC.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 09/02/2023.
//

import UIKit

class FavouritesListVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistanceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
    
}
