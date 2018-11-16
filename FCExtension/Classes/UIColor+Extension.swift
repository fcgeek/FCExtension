//
//  UIColor+CIExtension.swift
//  CommerceInteraction
//
//  Created by liujianlin on 16/4/14.
//  Copyright © 2016年 ocm. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     根据rgb值直接返回uicolor
     参数值要在0-255之间
     */
    convenience init(r:Int,g:Int,b:Int){
        self.init(red:CGFloat(r)/255.0, green:CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    convenience init(r:Int,g:Int,b:Int,alpha:CGFloat){
        self.init(red:CGFloat(r)/255.0, green:CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    class func black(withAlpha alpha:CGFloat)->UIColor{
        return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
    class func white(withAlpha alpha:CGFloat)->UIColor{
        return UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
    }
    
    func getAlphaColor(_ alpha: CGFloat) -> UIColor {
        let color = CIColor(color: self)
        return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: alpha)
    }
}
