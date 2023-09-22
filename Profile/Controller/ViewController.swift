//
//  ViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    let button2 = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(button)
        self.view.addSubview(button2)
        
        button.setTitle("마이페이지로 이동", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        
        button2.setTitle("코어 데이터", for: .normal)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button2.setTitleColor(.black, for: .normal)
        button2.backgroundColor = .green
        
        button.addTarget(self, action: #selector(moveMyPage), for: .touchUpInside)
        button2.addTarget(self, action: #selector(moveCoreData), for: .touchUpInside)
       
    }
    
    @objc func moveMyPage() {
        let ProfileDesignVC = ProfileDesignViewController()
        ProfileDesignVC.modalTransitionStyle = .coverVertical
        ProfileDesignVC.modalPresentationStyle = .fullScreen
        self.present(ProfileDesignVC, animated: true , completion: nil)
    }
    @objc func moveCoreData() {
        let Core = UIStoryboard.init(name: "CoreDataView", bundle: nil)
         guard let CoreDataController = Core.instantiateViewController(withIdentifier: "CoreDataView")as? CoreDataViewController else {return}
         
        CoreDataController.modalPresentationStyle = .fullScreen
         self.present(CoreDataController, animated: true, completion: nil)
    }
}

