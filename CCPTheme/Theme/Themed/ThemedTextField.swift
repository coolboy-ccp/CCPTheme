//
//  ThemedTextField.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

private var lightTitleColorKey: UInt8 = 0
private var darkTitleColorKey: UInt8 = 0

extension UITextField {
    open override var defaultLightBackgroundColor: UIColor {
        return .clear
    }
    
    open override var defaultDarkBackgroundColor: UIColor {
        return .clear
    }
    
    open var defaultDarkTitleColor: UIColor {
        return .white
    }
    
    open var defaultLightTitleColor: UIColor {
        return UIColor(red: 33, green: 40, blue: 51, alpha: 1.0)
    }
    
    @IBInspectable open var lightTitleColor: UIColor {
        set {
            objc_setAssociatedObject(self, &lightTitleColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &lightTitleColorKey) as? UIColor else {
                return defaultLightTitleColor
            }
            return color
        }
        
    }
    
    @IBInspectable open var darkTitleColor: UIColor {
        set {
            objc_setAssociatedObject(self, &darkTitleColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &darkTitleColorKey) as? UIColor else {
                return defaultDarkTitleColor
            }
            return color
        }
    }
    
    @objc open override func updateTheme() {
        super.updateTheme()
        keyboardAppearance = Theme.current.keyboard
        textColor = ThemedColor(lightTitleColor, darkTitleColor).current
    }
}

open class ThemedTextField: UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTheme()
        Notification.theme(self, sel: #selector(updateTheme))
    }
    
}
