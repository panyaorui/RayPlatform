//
//  PandShow.swift
//  RayPandShow
//
//  Created by ray on 16/1/13.
//  Copyright © 2016年 ray. All rights reserved.
//

import UIKit

class PandDetailView: UIView {
    
    //回调函数
    var action: (() -> ())? = {}

    class func viewFromNibNamed()->PandDetailView
    {
        let detail:PandDetailView = NSBundle.mainBundle().loadNibNamed("PandDetailView", owner: self, options: nil)[0] as! PandDetailView;
        return detail;
    }
    
    @IBAction func click(sender: AnyObject) {
        self.action!();
    }
    
}
