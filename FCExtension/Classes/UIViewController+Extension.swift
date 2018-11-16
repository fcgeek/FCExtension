//
//  UIViewController+Extension.swift
//  MoeBuy
//
//  Created by liujianlin on 2016/11/7.
//  Copyright © 2016年 xdream. All rights reserved.
//

import UIKit

extension UIViewController {
    func topViewController(_ vc:UIViewController) -> UIViewController {
        if let nav = vc as? UINavigationController {
            return topViewController(nav.visibleViewController!)
        }
        if let tab = vc as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = vc.presentedViewController {
            return topViewController(presented)
        }
        return vc
    }    
}
