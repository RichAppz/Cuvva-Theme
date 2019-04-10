//
//  CuvvaUILabel.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 10/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

class CuvvaUILabel: UILabel, CuvvaUIComponentProtocol {
    
    //================================================================================
    // MARK: - Properties
    //================================================================================
    
    var theme: CuvvaTheme?
    
    @IBInspectable var themeFont: String? {
        didSet {
            guard let font = themeFont?.font else { return }
            self.font = font
        }
    }
    
    @IBInspectable var themeColor: String? {
        didSet {
            textColor = themeColor?.color
        }
    }
    
    @IBInspectable var themeBackgroundColor: String? {
        didSet {
            backgroundColor = themeBackgroundColor?.color
        }
    }
    
    //================================================================================
    // MARK: - Initialization
    //================================================================================
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //================================================================================
    // MARK: - CuvvaUIComponent Protocol
    //================================================================================
    
    func handleThemeChangedNotification(notification: Notification) { }
    func loadTheme(_ theme: CuvvaTheme) {
        textColor = themeColor?.color
        backgroundColor = themeBackgroundColor?.color
        
        if let shadow = themeFont?.shadow {
            layer.shadowColor = shadow.color?.cgColor
            layer.shadowOffset = shadow.offset
            layer.shadowRadius = shadow.blurRadius
            layer.shadowOpacity = 1
        }
        
        guard let font = themeFont?.font else { return }
        self.font = font
    }
    
}
