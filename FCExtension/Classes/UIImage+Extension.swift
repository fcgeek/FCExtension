//
//  UIImage+CIExtension.swift
//  CommerceInteraction
//
//  Created by liujianlin on 16/4/14.
//  Copyright © 2016年 ocm. All rights reserved.
//

import UIKit
import Photos

extension UIImage {
    
    var circle: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image!.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    func maskRoundedImage(radius: CGFloat) -> UIImage {
        let imageLayer: CALayer = CALayer()
        imageLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        imageLayer.contents = self.cgImage
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = radius
        
        UIGraphicsBeginImageContext(size)
        imageLayer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return roundedImage
    }
}
