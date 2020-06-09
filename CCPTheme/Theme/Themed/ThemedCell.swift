//
//  ThemedTableView.swift
//  BCThemeTest
//
//  Created by 123 on 2020/6/4.
//  Copyright © 2020 ccp. All rights reserved.
//

import UIKit

open class ThemedCollectionCell: UICollectionViewCell {
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTheme()
        Notification.theme(self, sel: #selector(updateTheme))
    }
    
    @objc override open func updateTheme() {
        super.updateTheme()
        contentView.backgroundColor = ThemedColor(lightBackgound, darkBackground).current
    }
}

open class ThemedTableCell: UITableViewCell {
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTheme()
        Notification.theme(self, sel: #selector(updateTheme))
    }
    
    @objc open override func updateTheme() {
        super.updateTheme()
        contentView.backgroundColor = ThemedColor(lightBackgound, darkBackground).current
    }
}
