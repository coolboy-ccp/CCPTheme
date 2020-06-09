//
//  ThemedButton.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

private var lightBackgroundDisableKey: UInt8 = 0
private var darkBackgroundDisableKey: UInt8 = 0
private var lightBackgroundSelectedKey: UInt8 = 0
private var darkBackgroundSelectedKey: UInt8 = 0

open class ThemedButton: UIButton {
    open override var defaultDarkBackgroundColor: UIColor {
        return .clear
    }
    
    open override var defaultLightBackgroundColor: UIColor {
        return .clear
    }
    
    @IBInspectable open var lightBackgroundDisable: UIColor? {
        set {
            objc_setAssociatedObject(self, &lightBackgroundDisableKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &lightBackgroundDisableKey) as? UIColor else {
                return ThemedColor(lightBackgound, darkBackground).current
            }
            return color
        }
    }
    
    @IBInspectable open var darkBackgroundDisable: UIColor? {
        set {
            objc_setAssociatedObject(self, &darkBackgroundDisableKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &darkBackgroundDisableKey) as? UIColor else {
                return ThemedColor(lightBackgound, darkBackground).current
            }
            return color
        }
    }
    
    @IBInspectable open var lightBackgroundSelected: UIColor? {
        set {
            objc_setAssociatedObject(self, &lightBackgroundSelectedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &lightBackgroundSelectedKey) as? UIColor else {
                return ThemedColor(lightBackgound, darkBackground).current
            }
            return color
        }
    }
    
    @IBInspectable open var darkBackgroundSelected: UIColor? {
        set {
            objc_setAssociatedObject(self, &darkBackgroundSelectedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let color = objc_getAssociatedObject(self, &darkBackgroundSelectedKey) as? UIColor else {
                return ThemedColor(lightBackgound, darkBackground).current
            }
            return color
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = ThemedColor(lightBackgroundDisable, darkBackgroundDisable).current
            }
            else {
                backgroundColor = ThemedColor(lightBackgound, darkBackground).current
            }
        }
    }
    
    open override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = ThemedColor(lightBackgroundSelected, darkBackgroundSelected).current
            }
            else {
                backgroundColor = ThemedColor(lightBackgound, darkBackground).current
            }
        }
    }
    
    open override func updateTheme() {
        super.updateTheme()
        switch state {
        case .selected:
            backgroundColor = ThemedColor(lightBackgroundDisable, darkBackgroundDisable).current
        case .disabled:
            backgroundColor = ThemedColor(lightBackgroundDisable, darkBackgroundDisable).current
        default:
            backgroundColor = ThemedColor(lightBackgound, darkBackground).current
        }
    }
}
