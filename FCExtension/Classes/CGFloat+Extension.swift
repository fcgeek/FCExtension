//
//  CGFloat+Extension.swift
//  MoeBuy
//
//  Created by liujianlin on 16/8/10.
//  Copyright © 2016年 xdream. All rights reserved.
//

import UIKit

extension CGFloat {
    static func pixel(_ value:CGFloat) -> CGFloat {
        return value/UIScreen.main.scale
    }
    
    func square() -> CGFloat {
        return self * self
    }
}
