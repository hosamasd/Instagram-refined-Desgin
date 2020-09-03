//
//  PostThumbnailCollectionViewCell.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class PostThumbnailCollectionViewCell: UICollectionViewCell {
    
    lazy var thumbNailImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 20
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        return img
    }()
    
     lazy var multipleIcon:UIImageView = {
        let img = UIImageView(image:  UIImage(named: "multiple")?.withRenderingMode(.alwaysTemplate))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.tintColor = .white
        img.constrainWidth(constant: 20)
        img.constrainHeight(constant: 20)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews(views: thumbNailImage,multipleIcon)
        
        thumbNailImage.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        multipleIcon.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 10))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
