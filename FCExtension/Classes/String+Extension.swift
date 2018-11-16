//
//  String+CIExtension.swift
//  CommerceInteraction
//
//  Created by liujianlin on 16/5/12.
//  Copyright © 2016年 ocm. All rights reserved.
//

import UIKit

extension String {
    
    init(withMoney money: Int) {
        self = String.RMBFormater(money as NSNumber)
    }
    
    init(withMoney money: Float) {
        self = String.RMBFormater(money as NSNumber)
    }
    
    init(withMoney money: CGFloat) {
        self = String.RMBFormater(money as NSNumber)
    }
    
    static func RMBFormater(_ money: NSNumber) -> String {
        let str = moneyFormater(CGFloat(truncating: money))
        if str.isEmpty { return "" }
        return "\(str)"
    }
    
    static func moneyFormater(_ money: CGFloat) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingIncrement = 1
        formatter.roundingMode = .up
        guard let str = formatter.string(from: money as NSNumber) else {
            return ""
        }
        return str
    }
    
    static func numberFormater(_ money: CGFloat) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.roundingIncrement = 1
        formatter.roundingMode = .up
        guard let str = formatter.string(from: money as NSNumber) else {
            return ""
        }
        return str
    }
    
    static func numberFormater(_ money: Int) -> String {
        return numberFormater(CGFloat(money))
    }
    
    /**
     字符串限定宽度时的高度
     */
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    /**
     字符串限定高度时的宽度
     */
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.width
    }
    
    func lastIndex(of target: String) -> Int? {
        if let range = self.range(of: target, options: .backwards) {
            return distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func lines(withWidth width: CGFloat, font: UIFont) -> Int {
        let rHeight = heightWithConstrainedWidth(width, font: font)
        var lineCount:CGFloat = 0
        let charSize = CGFloat(font.lineHeight)
        lineCount = floor(rHeight / charSize)
        return Int(lineCount)        
    }    
    
    var toURL: URL? {
        var urlStr = self
        if !self.contains("://") {
            urlStr = "http://\(self)"
        } else if let url = URL(string: urlStr) {
            return url
        }
        guard let url = URL(string: urlStr) else { return nil }
        if !UIApplication.shared.canOpenURL(url) {return nil }
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        if !predicate.evaluate(with: urlStr) { return nil }
        return url
    }
}
