//
//  ThemedImageView.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

private var lightImageKey: UInt8 = 0
private var darkImageKey: UInt8 = 0

extension UIImageView {
    open override var defaultDarkBackgroundColor: UIColor {
        return .clear
    }
    
    open override var defaultLightBackgroundColor: UIColor {
        return .clear
    }
    
    @IBInspectable open var darkImage: UIImage? {
        set {
            objc_setAssociatedObject(self, &darkImageKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &darkImageKey) as? UIImage
        }
    }
    
    @IBInspectable open var lightImage: UIImage? {
        set {
            objc_setAssociatedObject(self, &darkImageKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &darkImageKey) as? UIImage
        }
    }
    
    open override func updateTheme() {
        super.updateTheme()
        image = ThemedImage(lightImage, darkImage).current
    }
}
