//
//  ProfileDesignView.swift
//  Profile
//
//  Created by 정동교 on 2023/09/22.
//

//https://github.com/WenchaoD/FSCalendar.git

// 수정 내역
import Foundation
import UIKit

// 로컬환경 내 컴퓨터
// 코드를 씁니다 그리고 커밋해!
// push 를 해줍니다 누구한테? main이나 내가 만든 brach 한테

// 깃헙 레포지토리
// main이랑 branch가 푸쉬 넣어준 친구가 반응함 아 커밋했구나!

// 풀 리퀘스트로 내가 만든 브렌치에서 - main브렌치로 머지~

extension ProfileDesignViewController{
    
    
    func addView(){
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
    }
    // ios적으로 생각하면 이 화면에도 구간. 덩어리로 나눠져 있을것이다 . 그걸 하나의 커스텀뷰 클래스로 만들면 그 안에서 오토레이아웃을 잡고 뷰를 거기서 만들고 거기서 청크 단위로 ? 덩어리 단위로 클래스를 만들어서 이렇게 길게 안써도 된다 파트를 나누는 방식? 파트를 나눠서 클래스를 만들고 이저 인포뷰를 하나 만들어서 클래스로서 뷰를 만들고 세팅하고 오토 레이아웃을 만들고 뷰 컨트롤러에선 그것을 묶고 있는 상위 뷰 클래스 몇개만 있다 헤더 밑에 유저 인포뷰를 오토레이아웃으로 잡아주고 한 뷰로 세네가지만 잡아주기 IOS는 객체적으로 다루는게 중요하다.
    
    func autoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        
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
        
        
        // 타이틀 라벨
        UserName.translatesAutoresizingMaskIntoConstraints = false
        
        UserName.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        UserName.text = "nabaecamp"
        UserName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        UserName.textColor = .black
        UserName.font = UIFont(name: "OpenSans-Bold", size: 18)
        UserName.textAlignment = .center
        
        
        // 오른쪽 삼각대 표시
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
        
        
        // View의 하위 뷰 넣는곳
        UserFollowInfo.translatesAutoresizingMaskIntoConstraints = false
        
        UserFollowInfo.leftAnchor.constraint(equalTo: self.UserPic.rightAnchor, constant: 28).isActive = true
        UserFollowInfo.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -23).isActive = true
        UserFollowInfo.centerYAnchor.constraint(equalTo: UserPic.centerYAnchor).isActive = true
        UserFollowInfo.topAnchor.constraint(equalTo: UserName.bottomAnchor, constant: 10).isActive = true
//        UserFollowInfo.backgroundColor = .brown
        
        
            // UserFollowInfo 하위 뷰 넣는곳
                Posts.translatesAutoresizingMaskIntoConstraints = false
                
                Posts.leftAnchor.constraint(equalTo: UserFollowInfo.leftAnchor, constant: 5).isActive = true
                Posts.rightAnchor.constraint(equalTo: Follower.leftAnchor, constant: -5).isActive = true
                Posts.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
                Posts.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
                Posts.widthAnchor.constraint(equalTo: UserFollowInfo.widthAnchor, multiplier: 0.3).isActive = true
        //        Posts.backgroundColor = .yellow
        
                // Posts 하위뷰
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

        
        
                Follower.translatesAutoresizingMaskIntoConstraints = false

                Follower.centerXAnchor.constraint(equalTo: UserFollowInfo.centerXAnchor).isActive = true
                Follower.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
                Follower.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
        //        Follower.backgroundColor = .red
        
                        // Follower 하위뷰
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

 

                Following.translatesAutoresizingMaskIntoConstraints = false

                Following.leftAnchor.constraint(equalTo: Follower.rightAnchor, constant: 5).isActive = true
                Following.rightAnchor.constraint(equalTo: UserFollowInfo.rightAnchor, constant: -5).isActive = true
                Following.centerYAnchor.constraint(equalTo: UserFollowInfo.centerYAnchor).isActive = true
                Following.topAnchor.constraint(equalTo: UserFollowInfo.topAnchor, constant: 10).isActive = true
        //        Following.backgroundColor = .blue
                        
                        // Following 하위뷰
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
                 
        
        
        
        UserInfo.translatesAutoresizingMaskIntoConstraints = false
        
        UserInfo.topAnchor.constraint(equalTo: UserPic.bottomAnchor, constant: 14).isActive = true
        UserInfo.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 14).isActive = true
        UserInfo.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -14).isActive = true
        UserInfo.heightAnchor.constraint(equalToConstant: 59) .isActive = true
//        UserInfo.backgroundColor = .orange
                
        
                // 유저 인포 관련
                // 유저 인포 하위뷰
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
        
        
        
        
        MiddleBar.translatesAutoresizingMaskIntoConstraints = false
        
        MiddleBar.topAnchor.constraint(equalTo: UserInfo.bottomAnchor, constant: 11).isActive = true
        MiddleBar.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 15).isActive = true
        MiddleBar.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -15).isActive = true
        MiddleBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        MiddleBar.backgroundColor = .green
        
        
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
        
   
        
        
        Nav_gallary.translatesAutoresizingMaskIntoConstraints = false
        
        Nav_gallary.topAnchor.constraint(equalTo: MiddleBar.bottomAnchor, constant: 10).isActive = true
        Nav_gallary.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1).isActive = true
        Nav_gallary.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        Nav_gallary.heightAnchor.constraint(equalToConstant: 43).isActive = true
//        Nav_gallary.backgroundColor = .yellow
        
        
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

                
                Section_indicator.translatesAutoresizingMaskIntoConstraints = false
        
                Section_indicator.topAnchor.constraint(equalTo: Nav_gallary.bottomAnchor, constant: -1).isActive = true
                Section_indicator.leftAnchor.constraint(equalTo: Nav_gallary.leftAnchor, constant: 0).isActive = true
                Section_indicator.bottomAnchor.constraint(equalTo: Nav_gallary.bottomAnchor, constant: 0).isActive = true
                Section_indicator.heightAnchor.constraint(equalToConstant: 1).isActive = true
                Section_indicator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3-2).isActive = true
                Section_indicator.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        // 컬렉션 뷰
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
                
                
                DividerRectagle.translatesAutoresizingMaskIntoConstraints = false
                
                DividerRectagle.topAnchor.constraint(equalTo: Rectangle.topAnchor, constant: 0).isActive = true
                DividerRectagle.leftAnchor.constraint(equalTo: Rectangle.leftAnchor, constant: 0).isActive = true
                DividerRectagle.rightAnchor.constraint(equalTo: Rectangle.rightAnchor, constant: 0).isActive = true
                DividerRectagle.heightAnchor.constraint(equalToConstant: 1).isActive = true
                
                DividerRectagle.layer.borderWidth = 0.4
                DividerRectagle.layer.borderColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1).cgColor
        
    }
}
