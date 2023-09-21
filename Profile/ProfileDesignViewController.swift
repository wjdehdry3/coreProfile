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
    let imageNames = ["picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7","picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7"]
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
        let safeArea = view.safeAreaLayoutGuide
        
        super.viewDidLoad()
        
        // 요소를 추가해 주려면 무조건 addSubbiew를 넣어주야 함
        self.view.addSubview(backButton)
        self.view.addSubview(UserName)
        self.view.addSubview(Menu)
        self.view.addSubview(UserPic)
        
        
        // 하위뷰
        self.view.addSubview(UserFollowInfo)
        self.view.addSubview(UserInfo)
        self.view.addSubview(MiddleBar)
        self.view.addSubview(Nav_gallary)
        self.view.addSubview(galleryCollectionView)
        self.view.addSubview(Rectangle)

        
        self.UserFollowInfo.addSubview(Posts)
        self.UserFollowInfo.addSubview(Follower)
        self.UserFollowInfo.addSubview(Following)
        
        self.Posts.addSubview(PostNum)
        self.Posts.addSubview(PostName)
        self.Follower.addSubview(FollowerNum)
        self.Follower.addSubview(FollowerName)
        self.Following.addSubview(FollowingNum)
        self.Following.addSubview(FollowingName)
        
        self.UserInfo.addSubview(Name)
        self.UserInfo.addSubview(Bio)
        self.UserInfo.addSubview(LinkInBio)
        
        self.MiddleBar.addSubview(Follow)
        self.MiddleBar.addSubview(Message)
        self.MiddleBar.addSubview(More)
        
        self.Nav_gallary.addSubview(Divider)
        self.Nav_gallary.addSubview(Section_indicator)
        self.Nav_gallary.addSubview(Grid)
        
        self.Rectangle.addSubview(myMenu)
        self.Rectangle.addSubview(DividerRectagle)
        
        // 뒤로가기
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setTitle("뒤로가기", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        backButton.heightAnchor.constraint(equalTo: UserName.heightAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        backButton.layer.cornerRadius = 4
        backButton.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 10).isActive = true
        backButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true

        backButton.addTarget(self, action: #selector(backProfile), for: .touchUpInside)
        
        
        // 타이틀 라벨
        UserName.translatesAutoresizingMaskIntoConstraints = false
        
        UserName.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        UserName.text = "nabaecamp"
        UserName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        UserName.textColor = .black
        UserName.font = UIFont(name: "OpenSans-Bold", size: 18)
        UserName.textAlignment = .center
        
        // 삼각대 표시
        // 공통적으로 들어감
        Menu.translatesAutoresizingMaskIntoConstraints = false
        
        Menu.titleLabel?.adjustsFontForContentSizeCategory = true
        Menu.setImage(UIImage(named: "Menu"), for: .normal)
        Menu.tintColor = .secondaryLabel
        Menu.setTitleColor(.secondaryLabel, for: .normal)
        
        Menu.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        Menu.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        
        // 이미지 넣는곳
        UserPic.translatesAutoresizingMaskIntoConstraints = false
        


        UserPic.image = UIImage(named: "picture1")
        // 여기서부터 뭔가 안됨???뭐지? 사진 크기를 설정 안해줘서 안됐던거임~
        
        
        UserPic.layer.cornerRadius = UserPic.frame.height/2
        UserPic.clipsToBounds = true
        UserPic.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        UserPic.topAnchor.constraint(equalTo: UserName.bottomAnchor, constant: 14).isActive = true
        UserPic.widthAnchor.constraint(equalToConstant: 88).isActive = true
        UserPic.heightAnchor.constraint(equalToConstant: 88).isActive = true
  
        UserPic.contentMode = .scaleAspectFill
        UserPic.layer.masksToBounds = true
        
        // 하위 뷰 넣는곳
        UserFollowInfo.translatesAutoresizingMaskIntoConstraints = false
        
        UserFollowInfo.leftAnchor.constraint(equalTo: self.UserPic.rightAnchor, constant: 28).isActive = true
        UserFollowInfo.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -23).isActive = true
        UserFollowInfo.centerYAnchor.constraint(equalTo: UserPic.centerYAnchor).isActive = true
        UserFollowInfo.topAnchor.constraint(equalTo: UserName.bottomAnchor, constant: 10).isActive = true
//        UserFollowInfo.backgroundColor = .brown
        
        UserInfo.translatesAutoresizingMaskIntoConstraints = false
        
        UserInfo.topAnchor.constraint(equalTo: UserPic.bottomAnchor, constant: 14).isActive = true
        UserInfo.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 14).isActive = true
        UserInfo.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -14).isActive = true
        UserInfo.heightAnchor.constraint(equalToConstant: 59) .isActive = true
//        UserInfo.backgroundColor = .orange
        
        
        MiddleBar.translatesAutoresizingMaskIntoConstraints = false
        
        MiddleBar.topAnchor.constraint(equalTo: UserInfo.bottomAnchor, constant: 11).isActive = true
        MiddleBar.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 15).isActive = true
        MiddleBar.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -15).isActive = true
        MiddleBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        MiddleBar.backgroundColor = .green
   
        Nav_gallary.translatesAutoresizingMaskIntoConstraints = false
        
        Nav_gallary.topAnchor.constraint(equalTo: MiddleBar.bottomAnchor, constant: 10).isActive = true
        Nav_gallary.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1).isActive = true
        Nav_gallary.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        Nav_gallary.heightAnchor.constraint(equalToConstant: 43).isActive = true
//        Nav_gallary.backgroundColor = .yellow
        
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        galleryCollectionView.topAnchor.constraint(equalTo: Nav_gallary.bottomAnchor, constant: 1).isActive = true
        galleryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1).isActive = true
        galleryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: Rectangle.topAnchor, constant: 0).isActive = true
//        galleryCollectionView.backgroundColor = .orange

        
        Rectangle.translatesAutoresizingMaskIntoConstraints = false
        
        Rectangle.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: 0).isActive = true
        Rectangle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1).isActive = true
        Rectangle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        Rectangle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1).isActive = true
        Rectangle.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        Rectangle.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        
        
        // UserFollowInfo 하위 뷰 넣는곳
        Posts.translatesAutoresizingMaskIntoConstraints = false
        
        Posts.leftAnchor.constraint(equalTo: UserFollowInfo.leftAnchor, constant: 5).isActive = true
        Posts.rightAnchor.constraint(equalTo: Follower.leftAnchor, constant: -5).isActive = true
        Posts.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
        Posts.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
        Posts.widthAnchor.constraint(equalTo: UserFollowInfo.widthAnchor, multiplier: 0.3).isActive = true
//        Posts.backgroundColor = .yellow
        
        Follower.translatesAutoresizingMaskIntoConstraints = false

        Follower.centerXAnchor.constraint(equalTo: UserFollowInfo.centerXAnchor).isActive = true
        Follower.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
        Follower.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
//        Follower.backgroundColor = .red

        Following.translatesAutoresizingMaskIntoConstraints = false

        Following.leftAnchor.constraint(equalTo: Follower.rightAnchor, constant: 5).isActive = true
        Following.rightAnchor.constraint(equalTo: UserFollowInfo.rightAnchor, constant: -5).isActive = true
        Following.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
        Following.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
//        Following.backgroundColor = .blue
        
        
        
        
        // 포스트 친구들 넣는곳
        PostNum.translatesAutoresizingMaskIntoConstraints = false

        PostNum.text = "0"
        PostNum.bottomAnchor.constraint(equalTo: Posts.centerYAnchor, constant: 0).isActive = true
        PostNum.centerXAnchor.constraint(equalTo: Posts.centerXAnchor).isActive = true
        PostNum.textColor = .black
        PostNum.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        PostNum.textAlignment = .center
        
        // 포스트 네임 넣는곳
        PostName.translatesAutoresizingMaskIntoConstraints = false

        PostName.text = "Post"
        PostName.topAnchor.constraint(equalTo: Posts.centerYAnchor, constant: 0).isActive = true
        PostName.centerXAnchor.constraint(equalTo: Posts.centerXAnchor).isActive = true
        PostName.textColor = .black
        PostName.font = UIFont(name: "OpenSans-Regular", size: 14)
        PostName.textAlignment = .center

        
        // Follower 친구들 넣기
        FollowerNum.translatesAutoresizingMaskIntoConstraints = false
        
        FollowerNum.text = "0"
        FollowerNum.bottomAnchor.constraint(equalTo: Follower.centerYAnchor, constant: 0).isActive = true
        FollowerNum.centerXAnchor.constraint(equalTo: FollowerName.centerXAnchor).isActive = true
        FollowerNum.textColor = .black
//        FollowerNum.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        FollowerNum.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        FollowerNum.textAlignment = .center

        
        // 팔로워 네임 넣는곳
        FollowerName.translatesAutoresizingMaskIntoConstraints = false

        FollowerName.text = "Follower"
        FollowerName.topAnchor.constraint(equalTo: Follower.centerYAnchor, constant: 0).isActive = true
        FollowerName.centerXAnchor.constraint(equalTo: Follower.centerXAnchor).isActive = true
        FollowerName.textColor = .black
        FollowerName.font = UIFont(name: "OpenSans-Regular", size: 14)
        FollowerName.textAlignment = .center

 
        // Following 친구들 넣기
        FollowingNum.translatesAutoresizingMaskIntoConstraints = false
        
        FollowingNum.text = "0"
        FollowingNum.bottomAnchor.constraint(equalTo: Following.centerYAnchor, constant: 0).isActive = true
        FollowingNum.centerXAnchor.constraint(equalTo: FollowingName.centerXAnchor).isActive = true
        FollowingNum.textColor = .black
//        FollowingNum.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        FollowingNum.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        FollowingNum.textAlignment = .center

        
        // 팔로워 네임 넣는곳
        FollowingName.translatesAutoresizingMaskIntoConstraints = false

        FollowingName.text = "Following"
        FollowingName.topAnchor.constraint(equalTo: Following.centerYAnchor, constant: 0).isActive = true
        FollowingName.centerXAnchor.constraint(equalTo: Following.centerXAnchor).isActive = true
        FollowingName.textColor = .black
        FollowingName.font = UIFont(name: "OpenSans-Regular", size: 14)
        FollowingName.textAlignment = .center
 
 
        // 유저 인포 관련

        Name.translatesAutoresizingMaskIntoConstraints = false
        
        Name.text = "르탄이"
        Name.topAnchor.constraint(equalTo: UserInfo.topAnchor, constant: 0).isActive = true
        Name.leftAnchor.constraint(equalTo: UserInfo.leftAnchor, constant: 0).isActive = true
        Name.rightAnchor.constraint(equalTo: UserInfo.rightAnchor, constant: 0).isActive = true
        Name.textColor = .black
        Name.font = UIFont(name: "OpenSans-Bold", size: 14)
        Name.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        Name.textAlignment = .left
        
        
        Bio.translatesAutoresizingMaskIntoConstraints = false
        
        Bio.text = "iOS Developer 🍎"
        Bio.topAnchor.constraint(equalTo: Name.bottomAnchor, constant: 2).isActive = true
        Bio.leftAnchor.constraint(equalTo: UserInfo.leftAnchor, constant: 0).isActive = true
        Bio.rightAnchor.constraint(equalTo: UserInfo.rightAnchor, constant: 0).isActive = true
        Bio.textColor = .black
        Bio.heightAnchor.constraint(equalToConstant: 19).isActive = true
        Bio.font = UIFont(name: "OpenSans-Regular", size: 14)
        Bio.textAlignment = .left
        
        LinkInBio.translatesAutoresizingMaskIntoConstraints = false
        
        LinkInBio.text = "spartacodingclub.kr"
        LinkInBio.topAnchor.constraint(equalTo: Bio.bottomAnchor, constant: 0).isActive = true
        LinkInBio.heightAnchor.constraint(equalToConstant: 19).isActive = true
        LinkInBio.leftAnchor.constraint(equalTo: UserInfo.leftAnchor, constant: 0).isActive = true
        LinkInBio.rightAnchor.constraint(equalTo: UserInfo.rightAnchor, constant: 0).isActive = true
//        LinkInBio.bottomAnchor.constraint(equalTo: UserInfo.bottomAnchor, constant: 0).isActive = true
        LinkInBio.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        LinkInBio.font = UIFont(name: "OpenSans-Regular", size: 14)
        LinkInBio.textAlignment = .left
        
        // 미들바 관련
        
        More.translatesAutoresizingMaskIntoConstraints = false
        
        More.titleLabel?.adjustsFontForContentSizeCategory = true
        More.setImage(UIImage(named: "More"), for: .normal)
        More.tintColor = .secondaryLabel
        More.setTitleColor(.secondaryLabel, for: .normal)
        More.heightAnchor.constraint(equalToConstant: 30).isActive = true
        More.widthAnchor.constraint(equalToConstant: 30).isActive = true
        More.rightAnchor.constraint(equalTo: MiddleBar.rightAnchor, constant: 0).isActive = true
        More.topAnchor.constraint(equalTo: MiddleBar.topAnchor, constant: 0).isActive = true
        
        Message.translatesAutoresizingMaskIntoConstraints = false
        
        Message.setTitle("Message", for: .normal)
        Message.setTitleColor(.black, for: .normal)
        Message.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        Message.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Message.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-76) / 2).isActive = true
        Message.backgroundColor = .white
        Message.layer.cornerRadius = 4
        Message.layer.borderWidth = 1.5
        Message.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        Message.rightAnchor.constraint(equalTo: More.leftAnchor, constant: -8).isActive = true
        Message.topAnchor.constraint(equalTo: MiddleBar.topAnchor, constant: 0).isActive = true
        
        Follow.translatesAutoresizingMaskIntoConstraints = false
        
        Follow.setTitle("Follow", for: .normal)
        Follow.setTitleColor(.white, for: .normal)
        Follow.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        Follow.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Follow.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-76) / 2).isActive = true
        Follow.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        Follow.layer.cornerRadius = 4
        Follow.rightAnchor.constraint(equalTo: Message.leftAnchor, constant: -8).isActive = true
        Follow.topAnchor.constraint(equalTo: MiddleBar.topAnchor, constant: 0).isActive = true
        
        
        // Nav_gallary 관련

        Divider.translatesAutoresizingMaskIntoConstraints = false
        
        Divider.topAnchor.constraint(equalTo: Nav_gallary.topAnchor, constant: 0).isActive = true
        Divider.leftAnchor.constraint(equalTo: Nav_gallary.leftAnchor, constant: 0).isActive = true
        Divider.rightAnchor.constraint(equalTo: Nav_gallary.rightAnchor, constant: 0).isActive = true
        Divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
        Divider.layer.borderWidth = 0.5
        Divider.layer.borderColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1).cgColor
        
        Grid.translatesAutoresizingMaskIntoConstraints = false
        
        Grid.titleLabel?.adjustsFontForContentSizeCategory = true
        Grid.setImage(UIImage(named: "Grid"), for: .normal)
        Grid.tintColor = .secondaryLabel
        Grid.setTitleColor(.secondaryLabel, for: .normal)
        Grid.heightAnchor.constraint(equalToConstant: 22.5).isActive = true
        Grid.widthAnchor.constraint(equalToConstant: 22.5).isActive = true
        Grid.leftAnchor.constraint(equalTo: Nav_gallary.leftAnchor, constant: ((UIScreen.main.bounds.width/3)/2)-11.25).isActive = true
        
        Grid.topAnchor.constraint(equalTo: Divider.bottomAnchor, constant: 8).isActive = true
        // mvvm 은 여기에서 뷰 모델을 추가? 뷰 모델?? 뷰 모델에다가 데이터를 넣어주는것?
        
        
        Section_indicator.translatesAutoresizingMaskIntoConstraints = false
        
        Section_indicator.topAnchor.constraint(equalTo: Nav_gallary.bottomAnchor, constant: -1).isActive = true
        Section_indicator.leftAnchor.constraint(equalTo: Nav_gallary.leftAnchor, constant: 0).isActive = true

        Section_indicator.bottomAnchor.constraint(equalTo: Nav_gallary.bottomAnchor, constant: 0).isActive = true
        Section_indicator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        Section_indicator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3-2).isActive = true
        Section_indicator.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        
        // Rectagle 관련
        myMenu.translatesAutoresizingMaskIntoConstraints = false
        
        myMenu.titleLabel?.adjustsFontForContentSizeCategory = true
        myMenu.setImage(UIImage(named: "Profile - Fill"), for: .normal)
        myMenu.tintColor = .secondaryLabel
        myMenu.setTitleColor(.secondaryLabel, for: .normal)
        myMenu.heightAnchor.constraint(equalToConstant: 22.75).isActive = true
        myMenu.widthAnchor.constraint(equalToConstant: 22.5).isActive = true
        myMenu.rightAnchor.constraint(equalTo: Rectangle.rightAnchor, constant: -((UIScreen.main.bounds.width/2)+11.25)).isActive = true
        myMenu.leftAnchor.constraint(equalTo: Rectangle.leftAnchor, constant: (UIScreen.main.bounds.width/2)-11.25).isActive = true
        myMenu.centerYAnchor.constraint(equalTo: Rectangle.centerYAnchor ,constant: -15).isActive = true
        myMenu.addTarget(self, action: #selector(moveProfile), for: .touchUpInside)

        DividerRectagle.translatesAutoresizingMaskIntoConstraints = false
        
        DividerRectagle.topAnchor.constraint(equalTo: Rectangle.topAnchor, constant: 0).isActive = true
        DividerRectagle.leftAnchor.constraint(equalTo: Rectangle.leftAnchor, constant: 0).isActive = true
        DividerRectagle.rightAnchor.constraint(equalTo: Rectangle.rightAnchor, constant: 0).isActive = true
        DividerRectagle.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        DividerRectagle.layer.borderWidth = 0.4
        DividerRectagle.layer.borderColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1).cgColor
        
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
        return CGSize(width: (collectionView.bounds.width - 2)/3, height: (collectionView.bounds.width - 2)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

}


