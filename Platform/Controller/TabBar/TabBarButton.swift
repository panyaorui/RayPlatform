//
//  RayButton.swift
//  CustomTab
//
//  Created by 水杯 on 14-11-20.
//  Copyright (c) 2014年 freedom. All rights reserved.
//

import UIKit

class TabBarButton: UIButton
{
    private var _value:CGFloat = 0.6;
    
    override init(frame: CGRect)
    {
        super.init(frame: frame);
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageWidth:CGFloat = contentRect.size.width;
        let imageHeight:CGFloat = contentRect.size.height * self._value;
        return CGRectMake(0, 5, imageWidth, imageHeight);
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect
    {
        let titleY:CGFloat = contentRect.size.height *  _value;
        let titleWidth:CGFloat = contentRect.size.width;
        let titleHeight:CGFloat = contentRect.size.height - titleY;
        return CGRectMake(0, titleY	, titleWidth, titleHeight)
    }

}
