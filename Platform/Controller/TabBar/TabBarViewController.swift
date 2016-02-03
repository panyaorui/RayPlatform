//
//  TabBarViewController.swift
//  CustomTab
//
//  Created by 水杯 on 14-11-20.
//  Copyright (c) 2014年 freedom. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,TabBarDelegate {
    
    var _tabBarView:TabBarView!;
    
    //private var views = []{};

    override func viewDidLoad() {
        super.viewDidLoad();
        self.tabBar.hidden = true;
        let tabBarY:CGFloat = self.view.frame.size.height - 49;
        let tabBarWidht = self.view.frame.width;
        _tabBarView = TabBarView(frame: CGRectMake(0, tabBarY, tabBarWidht, 49));
        _tabBarView.delegate = self;
        self.view.addSubview(_tabBarView);
        
        let first:MainViewController = MainViewController(nibName:"MainViewController", bundle: nil);
        let secound:MainViewController = MainViewController(nibName: "MainViewController", bundle: nil);
        let third:MainViewController = MainViewController(nibName:"MainViewController", bundle: nil);
        let four:MainViewController = MainViewController(nibName:"MainViewController", bundle: nil);
        let five:MyViewController = MyViewController(nibName:"MyViewController", bundle: nil);
        
        let navFirst:UINavigationController = UINavigationController(rootViewController: first);
        let navSecound:UINavigationController = UINavigationController(rootViewController: secound);
        let navThird:UINavigationController = UINavigationController(rootViewController: third);
        let navFour:UINavigationController = UINavigationController(rootViewController: four);
        let navFive:UINavigationController = UINavigationController(rootViewController: five);
        self.viewControllers = [navFirst,navSecound,navThird,navFour,navFive];
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeViewController(index: Int)
    {
        //var view = self.viewControllers;
        self.selectedIndex = index;
    }
    func hiddenTabbar()
    {
        _tabBarView.hidden = true;
    }
    func ShowTabbar()
    {
        _tabBarView.hidden = false;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
