//
//  PandTitleView.swift
//  RayPandShow
//
//  Created by ray on 16/1/13.
//  Copyright © 2016年 ray. All rights reserved.
//

import UIKit

class PandTitleView: UIView {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelOldPrice: UILabel!
    //回调函数
    var action: (() -> ())? = {}

    class func viewFromNibNamed()->PandTitleView
    {
        let titleView:PandTitleView = NSBundle.mainBundle().loadNibNamed("PandTitleView", owner: self, options: nil)[0] as! PandTitleView;
        
        return titleView;
    }
    func addAction(action :(() -> ())){
        self.action = action;
    }
    @IBAction func click(sender: AnyObject) {
        self.action!();
        /*
        self.titleView.hidden = false;
        
        UIView.animateWithDuration(self.duration, animations: { () -> Void in
            self.frame.size.height = 245;
            //  self.viewContent.frame.size.height = 245;
        })*/
    }
}
