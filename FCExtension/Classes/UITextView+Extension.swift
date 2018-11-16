//
//  UITextView+Extension.swift
//  rng
//
//  Created by liujianlin on 2017/7/28.
//  Copyright © 2017年 mikazuki. All rights reserved.
//

extension UITextView {
        
    /**
      文字间距
     */
    func setLineSpace(_ space:CGFloat = 4) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        paragraphStyle.alignment = textAlignment
        let ats: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : font!,
            NSAttributedString.Key.foregroundColor : textColor!,
            NSAttributedString.Key.paragraphStyle : paragraphStyle
        ]
        attributedText = NSAttributedString(string: text!, attributes: ats)
    }
    
    func scrollToBottom() {
        if text.count > 0 {
            let range = NSMakeRange(text.count-1, 1)
            scrollRangeToVisible(range)
        }
    }
}
