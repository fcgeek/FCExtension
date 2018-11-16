//
//  UIPageViewController+Extension.swift
//  rng
//
//  Created by liujianlin on 2017/7/14.
//  Copyright © 2017年 mikazuki. All rights reserved.
//

import UIKit

extension UIPageViewController {
    func setEnabledScroll(_ enabled: Bool) {
        for case let subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                scrollView.isScrollEnabled = enabled
            }
        }
    }
}
