//
//  ViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.setTitle("마이페이지로 이동", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        
        button.addTarget(self, action: #selector(moveMyPage), for: .touchUpInside)
    }
    
    @objc func moveMyPage() {
        let ProfileDesignVC = ProfileDesignViewController()
        ProfileDesignVC.modalTransitionStyle = .coverVertical
        ProfileDesignVC.modalPresentationStyle = .fullScreen
        self.present(ProfileDesignVC, animated: true , completion: nil)
    }
}

