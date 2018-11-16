//
//  UIFont+CIExtension.swift
//  CommerceInteraction
//
//  Created by liujianlin on 16/4/14.
//  Copyright © 2016年 ocm. All rights reserved.
//

enum SystemFontWeight : String {
    case UltraLight = "HelveticaNeue-UltraLight"
    case Thin = "HelveticaNeue-Thin"
    case Light = "HelveticaNeue-Light"
    case Regular = "HelveticaNeue"
    case Medium = "HelveticaNeue-Medium"
    case Semibold = "Helvetica-Bold"
    case Bold = "HelveticaNeue-Bold"
    case Heavy = "HelveticaNeue-CondensedBold"
    case Black = "HelveticaNeue-CondensedBlack"
    
    var weightValue:CGFloat? {
        if #available(iOS 8.2, *) {
            switch self {
            case .UltraLight:
                return UIFont.Weight.ultraLight.rawValue
            case .Thin:
                return UIFont.Weight.thin.rawValue
            case .Light:
                return UIFont.Weight.light.rawValue
            case .Regular:
                return UIFont.Weight.regular.rawValue
            case .Medium:
                return UIFont.Weight.medium.rawValue
            case .Semibold:
                return UIFont.Weight.semibold.rawValue
            case .Bold:
                return UIFont.Weight.bold.rawValue
            case .Heavy:
                return UIFont.Weight.heavy.rawValue
            case .Black:
                return UIFont.Weight.black.rawValue
            }
        } else {
            return nil
        }
    }
}

extension UIFont {
    static func systemFont(ofSize size: CGFloat, weight: SystemFontWeight) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: weight.weightValue!))
            
        } else {
            // Fallback on earlier versions
            return UIFont(name: weight.rawValue, size: size)!
        }
    }
    
    static func boldDincondFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "dincond-bold", size: size)!
    }
    
    static func DINLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "DIN-Light", size: size)!
    }

}
