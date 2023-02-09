//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Maciej Michalik on 09/02/2023.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView      = UIImageView()
    let usernameTextField  = GFTextField()
    let gitFollowersButton = GFButton(backgroundColor: .systemGreen, title: "Followers")
    
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
        }
    //gorny pasek nawigacji znika
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    // klawiatura znika gdy nacisniemy poza ui text field
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    //przenosi do listy followers po nacisnieciu
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 🤓", buttonTitle: "OK")
            return
        }
        
        
        let followersListVC      = FollowersListVC()
        followersListVC.username = usernameTextField.text
        followersListVC.title    = usernameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            //umiejscowienie logo
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton() {
        view.addSubview(gitFollowersButton)
        gitFollowersButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            gitFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            gitFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            gitFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            gitFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
//po wpisaniu tekstu przenosi do followers i pokazuje na gornym pasku co szukamy
extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
    
}
