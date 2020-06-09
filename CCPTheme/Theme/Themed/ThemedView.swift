//
//  ThemedView.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

private var lightColorKey: UInt8 = 0
private var darkColorKey: UInt8 = 0

/// 不写awakeFromNib为了防止项目中其他分类的冲突
extension UIView {
    
    @objc open var defaultLightBackgroundColor: UIColor {
        return .white
    }
    
    @objc open var defaultDarkBackgroundColor: UIColor {
        return UIColor(red: 19, green: 22, blue: 27, alpha: 1.0)
    }
    
    @IBInspectable var lightBackgound: UIColor {
        set {
            objc_setAssociatedObject(self, &lightColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &lightColorKey) as? UIColor else {
                return defaultLightBackgroundColor
            }
            return color
        }
    }
    
    @IBInspectable var darkBackground: UIColor {
        set {
            objc_setAssociatedObject(self, &darkColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &darkColorKey) as? UIColor else {
                return defaultDarkBackgroundColor
            }
            return color
        }
    }
    
    @objc func updateTheme() {
        backgroundColor = ThemedColor(lightBackgound, darkBackground).current
    }
}

open class ThemedView: UIView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTheme()
        Notification.theme(self, sel: #selector(updateTheme))
    }
}




