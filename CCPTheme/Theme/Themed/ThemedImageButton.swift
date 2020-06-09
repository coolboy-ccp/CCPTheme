//
//  ThemedImageButton.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

open class ThemedImageButton: UIButton {
    @IBInspectable open var lightImage: UIImage? {
        didSet {
            themedImage = ThemedImage(lightImage, darkImage)
        }
    }
    
    @IBInspectable open var darkImage: UIImage? {
        didSet {
            themedImage = ThemedImage(lightImage, darkImage)
        }
    }
    
    @IBInspectable open var lightImageSelected: UIImage? {
        didSet {
            themedImageSelected = ThemedImage(lightImageSelected, darkImageSelected)
        }
    }
    
    @IBInspectable open var darkImageSelected: UIImage? {
        didSet {
            themedImageSelected = ThemedImage(lightImageSelected, darkImageSelected)
        }
    }

    @IBInspectable open var lightImageDisable: UIImage? {
        didSet {
            themedImageDisable = ThemedImage(lightImageDisable, darkImageDisable)
        }
    }
    
    @IBInspectable open var darkImageDisable: UIImage? {
        didSet {
            themedImageDisable = ThemedImage(lightImageDisable, darkImageDisable)
        }
    }
    
    var themedImage: ThemedImage? {
        didSet {
            setImage(themedImage?.current, for: .normal)
        }
    }
    
    var themedImageSelected: ThemedImage? {
        didSet {
            setImage(themedImageSelected?.current, for: .selected)
        }
    }
    
    var themedImageDisable: ThemedImage? {
        didSet {
            setImage(themedImageSelected?.current, for: .disabled)
        }
    }
    
}
