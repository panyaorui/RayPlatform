//
//  RayCircleImageView.swift
//  ds
//
//  Created by Ray on 15/3/25.
//  Copyright (c) 2015年 Ray. All rights reserved.
//

import UIKit

class RayCircleImageView: UIImageView
{

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!;
        //添加圆角
        self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
        self.layer.masksToBounds = true;
        
        //添加变宽
        self.layer.borderWidth = 3;
        self.layer.borderColor = UIColor.whiteColor().CGColor;
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
    }

}
