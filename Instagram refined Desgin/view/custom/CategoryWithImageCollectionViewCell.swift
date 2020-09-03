//
//  CategoryWithImageCollectionViewCell.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CategoryWithImageCollectionViewCell: UICollectionViewCell {
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 22.5
        v.layer.borderColor = UIColor(white: 0, alpha: 0.07).cgColor
        v.layer.borderWidth = 2
        return v
    }()
    
    lazy var cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.constrainWidth(constant: 15)
        img.constrainHeight(constant: 15)
        return img
    }()
    
    lazy var cardLabel:UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews(views: cardView)
        cardView.fillSuperview()
        cardView.addSubViews(views: cardLabel,cardImage)
        
       cardImage.anchor(top: nil, leading: cardView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 15, bottom: 0, right: 0))

        cardLabel.anchor(top: nil, leading: cardImage.trailingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 5, bottom: 0, right: 15))
        
        NSLayoutConstraint.activate([
            cardImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            cardLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
