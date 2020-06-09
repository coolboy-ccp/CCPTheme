//
//  ThemedTitleButton.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

/// Only Themed Title
open class ThemedTitleButton: ThemedButton {
    
    @IBInspectable open var lightTitle: UIColor = UIColor(red: 33, green: 40, blue: 51, alpha: 1.0) {
        didSet {
            themedTitle = ThemedColor(lightTitle, darkTitle)
        }
    }
    
    @IBInspectable open var darkTitle: UIColor = UIColor.white {
        didSet {
            themedTitle = ThemedColor(lightTitle, darkTitle)
        }
    }
    
    @IBInspectable open var lightTitleSelected: UIColor = UIColor(red: 33, green: 40, blue: 51, alpha: 1.0) {
        didSet {
            themedTitleSelected = ThemedColor(lightTitleSelected, darkTitleSelected)
        }
    }
    
    @IBInspectable open var darkTitleSelected: UIColor = UIColor.white {
        didSet {
            themedTitleSelected = ThemedColor(lightTitleSelected, darkTitleSelected)
        }
    }
    
    
    @IBInspectable open var lightTitleDisable: UIColor = UIColor(red: 33, green: 40, blue: 51, alpha: 1.0) {
        didSet {
            themedTitleDisable = ThemedColor(lightTitleDisable, darkTitleDisable)
        }
    }
    
    @IBInspectable open var darkTitleDisable: UIColor = UIColor.white {
        didSet {
            themedTitleDisable = ThemedColor(lightTitleDisable, darkTitleDisable)
        }
    }
    
    open var themedTitle: ThemedColor?
    open var themedTitleSelected: ThemedColor?
    open var themedTitleDisable: ThemedColor?
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTheme()
        Notification.theme(self, sel: #selector(updateTheme))
    }
    
    open override func updateTheme() {
        setTitleColor(themedTitle?.current, for: .normal)
        setTitleColor(themedTitleSelected?.current, for: .selected)
        setTitleColor(themedTitleDisable?.current, for: .disabled)
    }

}
