//
//  SrcollImage.swift
//  Neighbour
//
//  Created by ray on 15/10/28.
//  Copyright © 2015年 ray. All rights reserved.
//

import UIKit

class SrcollImage: UIView {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollVIewWidth: NSLayoutConstraint!
    
    /** 图片宽度*/
    var imageWidth:Int = 90;
    /** 图片高度*/
    var imageHeight:Int = 90;
    /** 图片间距*/
    var imageSpace:Int = 10;
    
    
    /*
    - (id)initWithFrame:(CGRect)frame
    {
    self = [super initWithFrame:frame];
    if (self)
    {
    // Initialization code.
    //
    [[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil];
    [self addSubview:self.view];
    }
    return self;
    }
    
    - (void) awakeFromNib
    {
    [super awakeFromNib];
    
    [[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil];
    [self addSubview:self.view];
    }*/
    
    class func viewFromNibNamed(nib:NSString)->SrcollImage
    {
        return NSBundle.mainBundle().loadNibNamed("SrcollImage", owner: self, options: nil)[0] as! SrcollImage;
    }
    
    func setImages(images:NSArray){
        scrollVIewWidth.constant = CGFloat.init(images.count * (self.imageSpace+self.imageWidth));
        var index = 0;
        for img in images {
            let image:UIImageView = img as! UIImageView;
            image.frame = CGRectMake(CGFloat.init((index * self.imageWidth) + index * self.imageSpace) , 0, CGFloat.init(self.imageWidth), CGFloat.init(self.imageHeight));
            self.scrollView.addSubview(image);
            index++;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }

}
