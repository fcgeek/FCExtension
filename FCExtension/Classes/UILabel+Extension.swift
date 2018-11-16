//
//  UILabel+Extension.swift
//  MoeBuy
//
//  Created by liujianlin on 16/8/9.
//  Copyright © 2016年 xdream. All rights reserved.
//

import Foundation

extension UILabel {
    
    /**
     label 文字间距
     */
    func setLineSpace(_ space:CGFloat = 4) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        paragraphStyle.alignment = textAlignment
        let ats: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.paragraphStyle : paragraphStyle
        ]
        attributedText = NSAttributedString(string: text!, attributes: ats)
    }
    
    //行数
    func line() -> Int {
        let textSize = CGSize(width: bounds.width, height: CGFloat(Float.infinity));
        let rHeight = Float(sizeThatFits(textSize).height)
        var lineCount:Float = 0;
        let charSize = Float(font.lineHeight)
        lineCount = floor(rHeight / charSize)
        return Int(lineCount)
    }
    
    //字体改变动画
    func animate(font: UIFont, duration: TimeInterval) {
        // let oldFrame = frame
        let labelScale = self.font.pointSize / font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        // let newOrigin = frame.origin
        // frame.origin = oldFrame.origin // only for left aligned text
        // frame.origin = CGPoint(x: oldFrame.origin.x + oldFrame.width - frame.width, y: oldFrame.origin.y) // only for right aligned text
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            //L self.frame.origin = newOrigin
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}
