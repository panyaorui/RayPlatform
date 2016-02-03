//
//  TabBarView.swift
//  CustomTab
//
//  Created by 水杯 on 14-11-20.
//  Copyright (c) 2014年 freedom. All rights reserved.
//

import UIKit

protocol TabBarDelegate
{
    func changeViewController(index:Int);
}

class TabBarView: UIView {
    
    var delegate:TabBarDelegate?;
    
    private var _oldButton:TabBarButton = TabBarButton(type: UIButtonType.Custom);
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 244 / 255, alpha: 1);
        self.createButton("tab_home_nm",selectec: "tab_home_on", title: "主页", index: 0)
        self.createButton("tab_tfaccount_nm",selectec: "tab_tfaccount_on", title: "微淘", index: 1)
        self.createButton("tab_discover_nm",selectec: "tab_discover_on", title: "社区", index: 2)
        self.createButton("tab_cart_nm",selectec: "tab_cart_on", title: "购物车", index: 3)
        self.createButton("tab_account_nm",selectec: "tab_account_on", title: "我的", index: 4)
        changeViewController(self.subviews[0] as! TabBarButton);
        
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton(normal:NSString,selectec:NSString,title:NSString,index:NSInteger)
    {
        let button:TabBarButton = TabBarButton(type: UIButtonType.Custom);
        
        button.tag = index;
        
        let width = self.frame.size.width / 5;
        let hight = self.frame.size.height;
        
        let w:CGFloat = width * CGFloat(index);
        
        button.frame = CGRectMake(w, 0, width, hight);
        button.setImage(UIImage(named: normal as String), forState: UIControlState.Normal);
        button.setImage(UIImage(named: selectec as String), forState: UIControlState.Disabled);
        button.setTitle(title as String, forState: UIControlState.Normal);
        button.titleLabel?.font = UIFont(name: "Arial", size: 10.0);
        
        button.imageView?.contentMode = UIViewContentMode.Center;
        button.titleLabel?.textAlignment = NSTextAlignment.Center;
        button.setTitleColor(UIColor.orangeColor(), forState:UIControlState.Disabled);
        button.setTitleColor(UIColor.darkTextColor(), forState: UIControlState.Normal);
        button.addTarget(self, action:"changeViewController:", forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(button);
    }
    func changeViewController(button:TabBarButton)
    {
        button.enabled = false;
        if(_oldButton != button)
        {
            _oldButton.enabled = true;
            _oldButton = button;
        }
        delegate?.changeViewController(button.tag);
    }

}
