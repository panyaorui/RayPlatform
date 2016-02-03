//
//  HeadView.swift
//  Neighbour
//
//  Created by ray on 16/1/12.
//  Copyright © 2016年 ray. All rights reserved.
//

import UIKit
var KVOContext = ""
class PandShowView: UIView {
    
    @IBOutlet weak var head: UIView!
    var subView:UIView!;
    
    /** 内容标题视图*/
    var titleView:PandTitleView!;
    /** 内容详情视图*/
    var detailView: PandDetailView!;
     /** 动画时间*/
    var duration:NSTimeInterval = 0.5;
    /** 左右间距*/
    var space:CGFloat = 0;
    /** 头部间距*/
    var topSpace:CGFloat = 65;
    /** 高度*/
    var titleHeight:CGFloat = 45;
    /** 内容高度*/
    var detailHeight:CGFloat = 245;
    
    var isShow:Bool = false;
    
    var scrollView:UIScrollView!;
    var bool:Bool = true;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.initView();
        
     
    }
    init(frame: CGRect,scrollView:UIScrollView) {
         super.init(frame: frame);
        self.initView();
        
     //   self.scrollView = scrollView;
        //self.scrollView!.addObserver(self, forKeyPath: "contentOffset", options: .Initial, context: &KVOContext);
    }
    init(scrollView:UIScrollView){
        self.scrollView = scrollView;
         super.init(frame: CGRectMake(self.space, self.topSpace - self.titleHeight, self.scrollView!.frame.width - self.space * 2, self.titleHeight));
        self.subView = self.scrollView.subviews[0];
        self.subView.multipleTouchEnabled = true;
        self.subView.addGestureRecognizer(UIGestureRecognizer(target: self, action: "can:"));
       
        
        self.initView();
        
        self.scrollView = scrollView;
        self.scrollView!.addObserver(self, forKeyPath: "contentOffset", options: .Initial, context: &KVOContext);
    }
    
    private func initView(){
        self.clipsToBounds=true;
        
        self.titleView = PandTitleView.viewFromNibNamed()
        self.titleView.frame = CGRectMake(0, 0, self.frame.size.width, self.titleHeight);
        //设置titleView视图变化为详情视图
        self.titleView.action = { () -> () in
              self.titleView.hidden = true;
              self.detailView.hidden = false;
             UIView.animateWithDuration(self.duration, animations: { () -> Void in
                self.frame.size.height = self.detailHeight;
            })
        };
         self.addSubview(self.titleView);
        
        self.detailView = PandDetailView.viewFromNibNamed();
        self.detailView.frame = CGRectMake(0, 0, self.frame.size.width, self.detailHeight);
        self.detailView.action = {() -> ()in
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                self.frame.size.height = self.titleHeight;
                }, completion: { (b:Bool) -> Void in
                    print("1111")
                    self.titleView.hidden = false;
                    self.detailView.hidden = true;
            })

        }
        self.detailView.hidden = true;
        self.addSubview(self.detailView);
       
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if(!self.detailView.hidden && bool){
            bool = false;
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                self.frame.size.height = self.titleHeight;
                }, completion: { (b:Bool) -> Void in
                    self.bool = true;
                    self.titleView.hidden = false;
                    self.detailView.hidden = true;
            })
        }
        let point:CGPoint = self.scrollView!.contentOffset;
        if(point.y >= 100.5 && !self.isShow){
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                self.frame = CGRectMake(self.frame.origin.x, self.topSpace, self.frame.width, self.titleHeight);
            })
             self.isShow = true;
        }
        if(point.y < 100.5 && self.isShow){
            UIView.animateWithDuration(self.duration, animations: { () -> Void in
                self.frame = CGRectMake(self.frame.origin.x, self.topSpace - self.titleHeight, self.frame.width, self.titleHeight);
                }, completion: { (Bool) -> Void in
                    self.isShow = false;
            })
           
        }
    }


    

}
