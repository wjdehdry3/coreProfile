//
//  ProfileViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let userNameLabel = UILabel()
    let userAgeLabel = UILabel()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        super.viewDidLoad()
        self.view.addSubview(userNameLabel)
        self.view.addSubview(userAgeLabel)
        self.view.addSubview(backButton)
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel.text = userData.userName
        userNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50).isActive = true
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont(name: "OpenSans-Bold", size: 18)
        userNameLabel.textAlignment = .center
        
        userAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userAgeLabel.text = userData.userAge
        userAgeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        userAgeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive = true
        userAgeLabel.textColor = .black
        userAgeLabel.font = UIFont(name: "OpenSans-Bold", size: 18)
        userAgeLabel.textAlignment = .center
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setTitle("뒤로가기", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        backButton.layer.cornerRadius = 4
        backButton.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30).isActive = true

        backButton.addTarget(self, action: #selector(backProfile), for: .touchUpInside)
        
    }
    @objc func backProfile() {
        self.presentingViewController?.dismiss(animated: true)
    }
}

