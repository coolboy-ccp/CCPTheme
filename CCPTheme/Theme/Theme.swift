//
//  Theme.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

public extension Theme {
    static var current: Themes {
        return Theme.default.current
    }
    
    static func setup() {
        Theme.default.setup()
    }
    
    static func update(theme: Themes) {
        Theme.default.update(theme)
        Notification.post()
    }
}


public class Theme {
    
    private let themeKey = "com.binanceColod.themeKey"
    
    private static let `default` = Theme()
    
    private var current: Themes = .light
    
    private func setup() {
        guard let themeRawvalue = UserDefaults.standard.value(forKey: themeKey) as? String,
            let theme = Themes(rawValue: themeRawvalue) else {
            current = defaultTheme()
            return
        }
        current = theme
        
    }
    
    private func update(_ theme: Themes) {
        current = theme
        UserDefaults.standard.setValue(current.rawValue, forKey: themeKey)
    }
    
    private func defaultTheme() -> Themes {
        if #available(iOS 13.0, *) {
            switch UITraitCollection.current.userInterfaceStyle {
            case .dark:
                return .dark
            default:
                return .light
            }
        } else {
            return .light
        }
    }
    
}

public extension Notification {
    private static let themeChanged = Notification.Name("notifocation.name.themeChanged")
    
    internal static func post() {
        NotificationCenter.default.post(name: themeChanged, object: nil)
    }
    
    static func theme(_ observer: AnyObject, sel: Selector) {
        NotificationCenter.default.addObserver(observer, selector: sel, name: themeChanged, object: nil)
    }
}

