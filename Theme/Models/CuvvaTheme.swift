//
//  CuvvaTheme.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

struct CuvvaTheme: Codable {
    
    let fonts: CuvvaThemeFonts
    let colors: CuvvaThemeColors
    
}

struct CuvvaThemeColors: Codable {
    
    let primary: Color?
    let primaryVariant1: Color?
    let primaryVariant2: Color?
    let primaryVariant3: Color?
    let secondary: Color?
    let secondaryVariant1: Color?
    let secondaryVariant2: Color?
    let secondaryVariant3: Color?
    let tertiary: Color?
    let tertiaryVariant1: Color?
    let tertiaryVariant2: Color?
    let tertiaryVariant3: Color?
    let clear: Color?
    let statusAlert: Color?
    let statusPositive: Color?
    let statusPositiveDisabled: Color?
    let statusNegative: Color?
    
}

struct CuvvaThemeFonts: Codable {
    
    let navigationTitle: CuvvaFont?
    let titleRegular: CuvvaFont?
    let button: CuvvaFont?
    let body: CuvvaFont?
    let bodyBold: CuvvaFont?
    let bodyLight: CuvvaFont?
    let bodySmall: CuvvaFont?
    let bodySmallBold: CuvvaFont?
    let bodySmallLight: CuvvaFont?
    
}
