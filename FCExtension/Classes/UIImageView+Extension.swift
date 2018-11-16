//
//  UIImageView+Extension.swift
//  MoeBuy
//
//  Created by liujianlin on 16/9/13.
//  Copyright © 2016年 xdream. All rights reserved.
//

import UIKit

extension UIImageView {
    func drawImageWithRadius(_ radius: CGFloat) {
        //注意第三个选项的设置
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        //在绘制之前先裁剪出一个圆形
        UIBezierPath(roundedRect: bounds, cornerRadius: radius).addClip()
        //图片在设置的圆形里面进行绘制
        image?.draw(in: bounds)
        //获取图片
        image = UIGraphicsGetImageFromCurrentImageContext()
        //结束绘制
        UIGraphicsEndImageContext();
    }    
}
