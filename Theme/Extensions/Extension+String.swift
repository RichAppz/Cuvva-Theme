//
//  Extension+String.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var fontWeight: UIFont.Weight {
        switch self {
        case "UIFontWeightUltraLight": return .ultraLight
        case "UIFontWeightThin": return .thin
        case "UIFontWeightLight": return .light
        case "UIFontWeightMedium": return .medium
        case "UIFontWeightSemibold": return .semibold
        case "UIFontWeightBold": return .bold
        case "UIFontWeightHeavy": return .heavy
        case "UIFontWeightBlack": return .black
        default: return .regular
        }
    }
    
    var color: UIColor {
        guard
            let currentTheme = CuvvaThemeManager.shared.currentTheme,
            let mirrorValue = Mirror(reflecting: currentTheme.colors)
                .children.first(where: { $0.label == self })?.value,
            let color = mirrorValue as? Color else { return .clear }
        
        return color.value
    }
    
    var font: UIFont {
        guard
            let currentTheme = CuvvaThemeManager.shared.currentTheme,
            let mirrorValue = Mirror(reflecting: currentTheme.fonts)
                .children.first(where: { $0.label == self })?.value,
            let font = mirrorValue as? CuvvaFont else { return .systemFont(ofSize: 12, weight: .regular) }
        
        return font.font
    }
    
    var shadow: CuvvaShadow? {
        guard
            let currentTheme = CuvvaThemeManager.shared.currentTheme,
            let mirrorValue = Mirror(reflecting: currentTheme.fonts)
                .children.first(where: { $0.label == self })?.value,
            let font = mirrorValue as? CuvvaFont else { return nil }
        
        return font.shadow
    }
    
}
