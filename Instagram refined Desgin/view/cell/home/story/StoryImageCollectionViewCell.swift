//
//  StoryImageCollectionViewCell.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//


import UIKit

class StoryImageCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        img.layer.cornerRadius = 34
        img.constrainWidth(constant: 68)
        img.constrainHeight(constant: 68)
        return img
    }()
    
    lazy var backView:UIView = {
        let v = UIView(backgroundColor: .white)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 2
        v.layer.cornerRadius = 40
        v.constrainWidth(constant: 80)
        v.constrainHeight(constant: 80)
        return v
    }()
    
    lazy var userName = UILabel(text: "Dheeraj", font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: .black, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userName.translatesAutoresizingMaskIntoConstraints=false
        addSubViews(views: backView,userName)
        
        backView.addSubview(imageView)
        
        backView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        userName.anchor(top: backView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            userName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
