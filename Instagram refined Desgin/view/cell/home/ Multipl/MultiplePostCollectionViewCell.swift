//
//  MultiplePostCollectionViewCell.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//


import UIKit

class MultiplePostCollectionViewCell: UICollectionViewCell {
    
    let imgArr = ["img1" , "img2", "img3"]
    
    lazy var profilePicture:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "prof-img2")
        img.clipsToBounds = true
        img.layer.cornerRadius = 22.5
        img.constrainWidth(constant: 45)
        img.constrainHeight(constant: 45)
        return img
    }()
    
    lazy var userName:UILabel = {
        let l = UILabel()
        l.text = "Sammy"
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var optionsBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "options")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .lightGray
        btn.constrainWidth(constant: 45)
        btn.constrainHeight(constant: 45)
        return btn
    }()
    
    //MARK:- Multiple Post Collection
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(PostImageCollectionViewCell.self, forCellWithReuseIdentifier: "PostImageCollectionViewCell")
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    
    //MARK:- Like view
    
    lazy var likeBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"heart"), for: .normal)
        btn.constrainHeight(constant: 40)
        btn.constrainWidth(constant: 40)
        return btn
    }()
    
    lazy var likeLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "300+"
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return l
    }()
    
    //MARK:- Comment view
    
    lazy var commentBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"comment"), for: .normal)
        btn.constrainHeight(constant: 40)
        btn.constrainWidth(constant: 40)
        return btn
    }()
    
    lazy var commentLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "100+"
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return l
    }()
    lazy var likeStackView = getStack(views: likeBtn,likeLabel, spacing: 5, distribution: .fillEqually, axis: .horizontal)
    
    lazy var commentStackView = getStack(views: commentBtn,commentLabel, spacing: 5, distribution: .fillEqually, axis: .horizontal)
    lazy var topStackView = getStack(views: profilePicture,userName,optionsBtn, spacing: 8, distribution: .fill, axis: .horizontal)
    lazy var bottomStackView = getStack(views: likeStackView,commentStackView,UIView(),saveBtn,shareBtn, spacing: 8, distribution: .fill, axis: .horizontal).withMargins(.init(top: 0, left: 16, bottom: 0, right: 16))
    
    
    lazy var saveBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"save"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    lazy var shareBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"share"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    lazy var pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.currentPageIndicatorTintColor = .darkGray
        pg.pageIndicatorTintColor = CustomColor.appLightGray
        pg.currentPage = 0
        pg.numberOfPages = imgArr.count
        return pg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack(topStackView,collectionView,pageControl,bottomStackView,spacing:8).withMargins(.init(top: 8, left: 16, bottom: 8, right: 16))
        
        
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / collectionView.frame.width)
    }
}

extension MultiplePostCollectionViewCell:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCollectionViewCell", for: indexPath) as! PostImageCollectionViewCell
        cell.imagePreview.image = UIImage(named: imgArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}



struct CustomFont{
    static let logo = "Billabong"
}

struct CustomColor {
    static let appLightGray:UIColor = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1)
}
