//
//  CuvvaUIView.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 10/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

class CuvvaUIView: UIView, CuvvaUIComponentProtocol {
    
    //================================================================================
    // MARK: - Properties
    //================================================================================
    
    var theme: CuvvaTheme?
    
    @IBInspectable var themeColor: String? {
        didSet {
            backgroundColor = themeColor?.color
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
        self.theme = theme
        backgroundColor = themeColor?.color
    }
    
}
