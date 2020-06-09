//
//  ThemeConvertible.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit
protocol ThemeConvertible {
    associatedtype T
    var dark: T? { set get }
    var light: T? { set get }
    var current: T? { get }
    init(_ light: T?, _ dark: T?)
}

extension ThemeConvertible {
    public var current: T? {
        switch Theme.current {
        case .dark:
            return dark
        case .light:
            return light
        }
    }
}

public struct ThemedImage: ThemeConvertible {
    internal var dark: UIImage?
    internal var light: UIImage?
    
    public init(_ light: UIImage?, _ dark: UIImage?) {
        self.dark = dark
        self.light = light
    }
}

public struct ThemedColor: ThemeConvertible {
    internal var dark: UIColor?
    internal var light: UIColor?
    
    public init(_ light: UIColor?, _ dark: UIColor?) {
        self.dark = dark
        self.light = light
    }
}

