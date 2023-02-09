//
//  FollowersListVC.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 09/02/2023.
//

import UIKit

class FollowersListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
