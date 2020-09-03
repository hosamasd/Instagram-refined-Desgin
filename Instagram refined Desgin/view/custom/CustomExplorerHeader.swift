//
//  CustomExplorerHeader.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CustomExplorerHeader: UIView {
    
    let categoryArr:[String] = ["IGTV" , "Shop" , "Photograph" , "Decor" , "Travel" , "Architecture" , "Art" , "Food"]
    
    lazy var searchBarView:UIView = {
        let v = UIView(backgroundColor: .white)
        v.constrainHeight(constant: 50)
        v.hstack(searchIcon,searchBar,scanIcon)
        return v
    }()
    
    lazy var searchBar:UIView = {
        let v = UIView(backgroundColor: UIColor(white: 0, alpha: 0.1))
        v.layer.cornerRadius = 22.5
        v.hstack(searchLabel).padLeft(16)
        return v
    }()
    
    lazy var searchLabel = UILabel(text: "Search", font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .lightGray)
    
    lazy var searchIcon:UIImageView = {
        let img = UIImageView(image:  UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), contentMode: .scaleAspectFill)
        img.tintColor = .black
        img.clipsToBounds = true
        img.constrainHeight(constant: 50)
        img.constrainWidth(constant: 50)
        return img
    }()
    
    lazy var scanIcon:UIImageView = {
        let img = UIImageView(image: UIImage(named: "scan")?.withRenderingMode(.alwaysOriginal), contentMode: .scaleAspectFill)
        img.clipsToBounds = true
        img.constrainHeight(constant: 50)
        img.constrainWidth(constant: 50)
        return img
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.showsHorizontalScrollIndicator = false
        cv.register(CategoryWithImageCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryWithImageCollectionViewCell")
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        cv.backgroundColor = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        //        cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(searchBarView,collectionView,spacing:8).withMargins(.init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomExplorerHeader:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row >= 0 && indexPath.row <= 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryWithImageCollectionViewCell", for: indexPath) as! CategoryWithImageCollectionViewCell
            if indexPath.row == 0 {
                cell.cardImage.isHidden = false
                cell.cardImage.image = UIImage(named: "igtv")
            }
            if indexPath.row == 1 {
                cell.cardImage.isHidden = false
                cell.cardImage.image = UIImage(named: "shop")
            }
            cell.cardLabel.text = categoryArr[indexPath.row]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.cardLabel.text = categoryArr[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = categoryArr[indexPath.row]
        let font = UIFont.systemFont(ofSize: 15)
        let width = string.size(OfFont: font).width
        if indexPath.row >= 0 && indexPath.row <= 1 {
            return CGSize(width: width + 60, height: 45)
        }
        return CGSize(width: width + 40, height: 45)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
