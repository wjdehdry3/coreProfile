//
//  ProfileViewController.swift
//  Profile
//
//  Created by 정동교 on 2023/09/21.
//

//import UIKit
//import FSCalendar
//import Foundation
//
//class ProfileViewController: UIViewController {
//    
//
//    let backButton = UIButton()
//    // 현재 캘린더가 보여주고 있는 Page 트래킹
//    lazy var currentPage = calendarView.currentPage
//
//    // 이전 달로 이동 버튼
//    private let prevButton = UIButton(type: .system).dene {
//        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
//        $0.tintColor = .black
//    }
//    
//    // 다음 달로 이동 버튼
//    private let nextButton = UIButton(type: .system) {
//        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
//        $0.tintColor = .black
//    }
//    
//    private lazy var calendarView: FSCalendar = {
//        let calendar = FSCalendar()
//        calendar.dataSource = self
//        calendar.delegate = self
//        
//        // 첫 열을 월요일로 설정
//        calendar.firstWeekday = 2
//        // week 또는 month 가능
//        calendar.scope = .month
//        
//        calendar.scrollEnabled = false
//        calendar.locale = Locale(identifier: "ko_KR")
//        
//        // 현재 달의 날짜들만 표기하도록 설정
//        calendar.placeholderType = .none
//        
//        // 헤더뷰 설정
//                calendar.headerHeight = 55
//        calendar.appearance.headerDateFormat = "MM월"
//        calendar.appearance.headerTitleColor = .black
//        
//        // 요일 UI 설정
////        calendar.appearance.weekdayFont = UIFont.font(.pretendardRegular, ofSize: 12)
//        calendar.appearance.weekdayTextColor = .black
//        
//        // 날짜 UI 설정
//        calendar.appearance.titleTodayColor = .black
//        calendar.appearance.titleFont = UIFont.font(.pretendardRegular, ofSize: 16)
//        calendar.appearance.subtitleFont = UIFont.font(.pretendardMedium, ofSize: 10)
//        calendar.appearance.subtitleTodayColor = .korailPrimaryColor
//        calendar.appearance.todayColor = .white
//                
//        // 일요일 라벨의 textColor를 red로 설정
//        calendar.calendarWeekdayView.weekdayLabels.last!.textColor = .red
//        return calendar
//    }()
//    
//    override func viewDidLoad() {
//        view.backgroundColor = .white
//       
//        super.viewDidLoad()
//        setUI()
//        setLayout()
//        setAction()
//        backButton.addTarget(self, action: #selector(backProfile), for: .touchUpInside)
//        
//    }
//    @objc func backProfile() {
//        self.presentingViewController?.dismiss(animated: true)
//    }
//}
//
//extension ProfileViewController {
//    private func setUI() {
//        view.backgroundColor = .white
//    }
//
//    private func setLayout() {
//        view.addSubview(calendarView)
//        calendarView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.height.equalTo(296)
//            make.width.equalTo(356)
//        }
//
//        view.addSubviews(prevButton, nextButton)
//        prevButton.snp.makeConstraints { make in
//            make.centerY.equalTo(calendarView.calendarHeaderView).multipliedBy(1.1)
//            make.leading.equalTo(calendarView.calendarHeaderView.snp.leading).inset(140)
//        }
//
//        nextButton.snp.makeConstraints { make in
//            make.centerY.equalTo(calendarView.calendarHeaderView).multipliedBy(1.1)
//            make.trailing.equalTo(calendarView.calendarHeaderView.snp.trailing).inset(140)
//        }
//    }
//
//    private func setAction() {
//        [prevButton, nextButton].forEach {
//            $0.addTarget(self, action: #selector(moveMonthButtonDidTap(sender:)), for: .touchUpInside)
//        }
//    }
//
//    @objc func moveMonthButtonDidTap(sender: UIButton) {
//        moveMonth(next: sender == nextButton)
//    }
//
//    // 달 이동 로직
//    func moveMonth(next: Bool) {
//        var dateComponents = DateComponents()
//        dateComponents.month = next ? 1 : -1
//        self.currentPage = Calendar.current.date(byAdding: dateComponents, to: self.currentPage)!
//        calendarView.setCurrentPage(self.currentPage, animated: true)
//    }
//}
//
//// MARK: - FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance
//extension ProfileViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
//
//    // 공식 문서에서 레이아우울을 위해 아래의 코드 요구
//    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
//        calendar.snp.updateConstraints { (make) in
//            make.height.equalTo(bounds.height)
//            // Do other updates
//        }
//        self.view.layoutIfNeeded()
//    }
//
//    // 오늘 cell에 subtitle 생성
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "ko_KR")
//        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//
//        switch dateFormatter.string(from: date) {
//        case dateFormatter.string(from: Date()):
//            return "오늘"
//
//        default:
//            return nil
//
//        }
//    }
//
//    // 일요일에 해당되는 모든 날짜의 색상 red로 변경
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//        let day = Calendar.current.component(.weekday, from: date) - 1
//
//        if Calendar.current.shortWeekdaySymbols[day] == "일" {
//            return .systemRed
//        } else {
//            return .label
//        }
//    }
//}
