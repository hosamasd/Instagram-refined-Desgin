//
//  HomeViewController.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(StoriesHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoriesHeaderCollectionReusableView")
        cv.register(MultiplePostCollectionViewCell.self, forCellWithReuseIdentifier: "MultiplePostCollectionViewCell")
        cv.backgroundColor = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
    }
    
    func setupNavigation()  {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(text: "Instagram", font: UIFont.systemFont(ofSize: 30), textColor: .black)
        titleLabel.sizeToFit()
        let LeftTitleItem = UIBarButtonItem(customView: titleLabel)
        
        let messageButton = UIButton(type: .system)
        messageButton.setImage(UIImage(named: "shareNav")?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: messageButton)
        messageButton.addTarget(self, action: #selector(messageBtnPressed), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = messageButton
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
        
        let cameraBtn = UIButton(type: .system)
        cameraBtn.setImage(UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal), for: .normal)
        cameraBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cameraBtn)
        cameraBtn.addTarget(self, action: #selector(messageBtnPressed), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = cameraBtn
        navigationItem.setLeftBarButtonItems([leftBarButtonItem,LeftTitleItem], animated: true)
    }
    
    func setupViews()  {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        
    }
    
    @objc func messageBtnPressed(){
        
    }
    
    
}


extension HomeViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoriesHeaderCollectionReusableView", for: indexPath) as! StoriesHeaderCollectionReusableView
            header.backgroundColor = .white
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiplePostCollectionViewCell", for: indexPath) as! MultiplePostCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 580)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

