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
       
        super.viewDidLoad()
        addView()
        autoLayout()

        backButton.addTarget(self, action: #selector(backProfile), for: .touchUpInside)
        
    }
    @objc func backProfile() {
        self.presentingViewController?.dismiss(animated: true)
    }
}

