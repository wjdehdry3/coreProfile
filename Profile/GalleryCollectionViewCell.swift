//
//  GalleryCollectionViewCell.swift
//  Profile
//
//  Created by 정동교 on 2023/09/21.
//

import UIKit
import SnapKit

class GalleryCollectionViewCell: UICollectionViewCell {
    

    static let identifier = "GalleryCollectionViewCell"
    

    let galleryImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        contentView.addSubview(galleryImageView)
    }
    
    // Cell 객체 autoLayout 스냅킷 함 써보고 싶었음 ㅎ
    private func autoLayout() {
        
        galleryImageView.snp.makeConstraints { make in
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

