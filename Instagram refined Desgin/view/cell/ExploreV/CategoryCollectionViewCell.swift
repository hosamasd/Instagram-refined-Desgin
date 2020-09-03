//
//  CategoryCollectionViewCell.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 22.5
        v.layer.borderColor = UIColor(white: 0, alpha: 0.07).cgColor
        v.layer.borderWidth = 2
        return v
    }()
    
    lazy var  cardLabel:UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(cardLabel)
        cardView.fillSuperview()
        
        cardLabel.anchor(top: nil, leading: cardView.leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 15, bottom: 0, right: 15))
        
        NSLayoutConstraint.activate([
            cardLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
