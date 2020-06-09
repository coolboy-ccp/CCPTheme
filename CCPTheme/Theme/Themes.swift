//
//  Themes.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

public enum Themes: String, CaseIterable {
    case light
    case dark
}

public extension Themes {
    static var availableThemes: [String] {
        return Themes.allCases.map { $0.rawValue }
    }
    
    var keyboard: UIKeyboardAppearance {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
    
    var tabbarStyle: UIBarStyle {
        switch self {
        case .dark:
            return .black
        case .light:
            return .default
        }
    }
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .dark:
            return .lightContent
        default:
            return .default
        }
    }
}


