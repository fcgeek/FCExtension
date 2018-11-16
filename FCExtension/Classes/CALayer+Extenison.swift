//
//  CALayer+Extenison.swift
//  rng
//
//  Created by liujianlin on 2017/7/28.
//  Copyright © 2017年 mikazuki. All rights reserved.
//

extension CALayer {
        
    var snapshotImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
