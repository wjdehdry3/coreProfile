//
//  ProfileDesignViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/19.
//

import UIKit
import SnapKit
// UI를 코드로 짜면서 느낌점 : 어...무언가 코드를 썻는데 적용이 안되면 크기 설정이나 위치 설정을 해줘봐라~
class ProfileDesignViewController: UIViewController {

    // UI속성
    let UserName = UILabel()
    let backButton = UIButton()
    let Menu = UIButton()
    // 사진은 크기 설정 넣어줘야 되는거였음~
    let UserPic = UIImageView(frame: CGRect(x: 0, y: 0, width: 88, height: 88))
    // 포스트 관련
    let PostNum = UILabel()
    let PostName = UILabel()
    // 팔로워 관련
    let FollowerNum = UILabel()
    let FollowerName = UILabel()
    // 팔로잉 관련
    let FollowingNum = UILabel()
    let FollowingName = UILabel()
    // 유저인포 관련
    let Name = UILabel()
    let Bio = UILabel()
    let LinkInBio = UILabel()
    // 미들바 관련
    let Follow = UIButton()
    let Message = UIButton()
    let More = UIButton()
    // 내비갤러리 관련
    let Divider = UIView()
    let Section_indicator = UIView()
    let Grid = UIButton()
    
    // 갈색
    let UserFollowInfo = UIView()
    // 노랑이
    let Posts = UIView()
    // 빨강이
    let Follower = UIView()
    // 파랑이
    let Following = UIView()
    // 주황이
    let UserInfo = UIStackView()
    // 초록이
    let MiddleBar = UIView()
    // 보라돌이
    let Nav_gallary = UIView()
    // 회색
    let galleryCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        
        return cv
    }()
    // 주황이
    let Rectangle = UIView()
    let myMenu = UIButton()
    let DividerRectagle = UIView()
    
    
    override func viewDidLoad() {
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        super.viewDidLoad()
        addView()
        autoLayout()
        
        // 뒤로가기
        backButton.addTarget(self, action: #selector(backProfile), for: .touchUpInside)

        // Rectagle 관련
        myMenu.addTarget(self, action: #selector(moveProfile), for: .touchUpInside)

        // 기본이 되는 view의 백그라운드 컬러 설정
        view.backgroundColor = .white
    }

    @objc func moveProfile() {
        let ProfileDesignVC = ProfileViewController()
        ProfileDesignVC.modalTransitionStyle = .coverVertical
        ProfileDesignVC.modalPresentationStyle = .fullScreen
        self.present(ProfileDesignVC, animated: true , completion: nil)
    }
    @objc func backProfile() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}


extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        print(imageNames[indexPath.item])
        cell.galleryImageView.image = UIImage(named: imageNames[indexPath.item])

        return cell
    }
}

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 4)/3, height: (collectionView.bounds.width - 4)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

}


