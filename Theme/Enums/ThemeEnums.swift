//
//  ThemeEnums.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation

public enum CuvvaThemeError: Error {
    case inValidJSON
    case inValidJSONString
}

public enum JSONVariable: String {
    case filename, postScriptName, size, weight, shadow, color, blurRadius, dx, dy
}

public enum ThemeColor: String {
    case primary, primaryVariant1, primaryVariant2, primaryVariant3
    case secondary, secondaryVariant1, secondaryVariant2, secondaryVariant3
    case tertiary, tertiaryVariant1, tertiaryVariant2, tertiaryVariant3
    case clear
    case statusAlert, statusPositive, statusPositiveDisabled, statusNegative
}

public enum FontType: String {
    case navigationTitle, titleRegular, button
    case body, bodyBold, bodyLight, bodySmall, bodySmallBold, bodySmallLight
}
