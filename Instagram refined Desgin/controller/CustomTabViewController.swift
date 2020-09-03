//
//  ViewController.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class CustomTabViewController: UITabBarController {

    var homeViewController:UIViewController!
    var exploreViewController:UIViewController!
    var addViewController:UIViewController!
    var activityViewController:UIViewController!
    var profileViewController:UIViewController!
    
    var tabItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = HomeViewController()
        homeViewController = UINavigationController(rootViewController: vc1)
        
        let vc2 = ExploreViewController()
        exploreViewController = vc2
        
        let vc3 = AddViewController()
        addViewController = UINavigationController(rootViewController: vc3)
        
        let vc4 = ActivityViewController()
        activityViewController = UINavigationController(rootViewController: vc4)
        
        let vc5 = ProfileViewController()
        profileViewController = UINavigationController(rootViewController: vc5)
        
        viewControllers = [homeViewController , exploreViewController , addViewController , activityViewController, profileViewController]
        
        setUpViews()
        
        customTab(selectedImage: "home-selected", deselectedImage: "home", indexOfTab: 0 , tabTitle: "")
        customTab(selectedImage: "search-selected", deselectedImage: "search", indexOfTab: 1 , tabTitle: "")
        customTab(selectedImage: "add-selected", deselectedImage: "add", indexOfTab: 2 , tabTitle: "")
        customTab(selectedImage: "activity-selected", deselectedImage: "activity", indexOfTab: 3 , tabTitle: "")
        customTab(selectedImage: "user-selected", deselectedImage: "user", indexOfTab: 4 , tabTitle: "")
    }
    
    func setUpViews(){
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.black
        self.tabBar.shadowImage = UIImage()
    }
    
    func customTab(selectedImage image1 : String , deselectedImage image2: String , indexOfTab index: Int , tabTitle title: String ){

        let selectedImage = UIImage(named: image1)
        let deselectedImage = UIImage(named: image2)
        
        tabItem = self.tabBar.items![index]
        tabItem.image = deselectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = .none
        tabItem.imageInsets.bottom = -16
    }
    
}
