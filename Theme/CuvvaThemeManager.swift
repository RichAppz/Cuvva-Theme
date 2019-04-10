//
//  CuvvaThemeManager.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

public var kDefaultTheme: String { return "default_theme" }

class CuvvaThemeManager {
    
    //================================================================================
    // MARK: - Properties
    //================================================================================
    
    var currentTheme: CuvvaTheme? {
        didSet {
            NotificationCenter.default.post(
                name: kThemeDidChangedNotification,
                object: currentTheme
            )
        }
    }
    
    //================================================================================
    // MARK: - Singleton
    //================================================================================
    
    static let shared = CuvvaThemeManager()
    
    //================================================================================
    // MARK: - Helpers
    //================================================================================
    
    static func initialize(themeName: String = kDefaultTheme) {
        shared.loadBundle(themeName)
    }
    
    static func setTheme(_ theme: CuvvaTheme) {
        shared.currentTheme = theme
    }
    
    static func randomise() {
        let scriptName: String = ["System", "Times", "Copperplate", "ArialRoundedMTBold"].randomElement() ?? "System"
        setTheme(CuvvaTheme(
            fonts: CuvvaThemeFonts(
                navigationTitle: CuvvaFont(scriptName: scriptName, size: CGFloat(Int.random(in: 10..<20))),
                titleRegular: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                button: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                body: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                bodyBold: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                bodyLight: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                bodySmall: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                bodySmallBold: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20))),
                bodySmallLight: CuvvaFont(scriptName: scriptName,size: CGFloat(Int.random(in: 10..<20)))),
            colors: CuvvaThemeColors(
                primary: Color(.random), primaryVariant1: Color(.random), primaryVariant2: Color(.random), primaryVariant3: Color(.random),
                secondary: Color(.random), secondaryVariant1: Color(.random), secondaryVariant2: Color(.random), secondaryVariant3: Color(.random),
                tertiary: Color(.random), tertiaryVariant1: Color(.random), tertiaryVariant2: Color(.random), tertiaryVariant3: Color(.random),
                clear: Color(.clear), statusAlert: Color(.random), statusPositive: Color(.random), statusPositiveDisabled: Color(.random),
                statusNegative: Color(.random)
            )
        ))
    }
    
    func loadBundle(_ themeName: String) {
        guard
            let filePath = Bundle.main.path(forResource: themeName, ofType: "json"),
            let string = try? String(contentsOfFile: filePath, encoding: .utf8) else { return }
        
        currentTheme = try? CuvvaTheme(string: string)
    }
    
}
