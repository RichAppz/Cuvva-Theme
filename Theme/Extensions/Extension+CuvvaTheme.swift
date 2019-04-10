//
//  Extension+CuvvaTheme.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

extension CuvvaTheme {
    
    //================================================================================
    // MARK: - Initialization
    //================================================================================
    
    init(json: [String: Any]?) throws {
        do {
            let object = try CuvvaTheme.fromJson(json)
            self.init(
                fonts: CuvvaThemeFonts(
                    navigationTitle: object.fonts.navigationTitle, titleRegular: object.fonts.titleRegular, button: object.fonts.button,
                    body: object.fonts.body, bodyBold: object.fonts.bodyBold, bodyLight: object.fonts.bodyLight, bodySmall: object.fonts.bodySmall,
                    bodySmallBold: object.fonts.bodySmallBold, bodySmallLight: object.fonts.bodySmallLight),
                colors: CuvvaThemeColors(
                    primary: object.colors.primary, primaryVariant1: object.colors.primaryVariant1, primaryVariant2: object.colors.primaryVariant2,
                    primaryVariant3: object.colors.primaryVariant3, secondary: object.colors.secondary, secondaryVariant1: object.colors.secondaryVariant1,
                    secondaryVariant2: object.colors.secondaryVariant2, secondaryVariant3: object.colors.secondaryVariant3, tertiary: object.colors.tertiary,
                    tertiaryVariant1: object.colors.tertiaryVariant1, tertiaryVariant2: object.colors.tertiaryVariant2, tertiaryVariant3: object.colors.tertiaryVariant3,
                    clear: object.colors.clear, statusAlert: object.colors.statusAlert, statusPositive: object.colors.statusPositive,
                    statusPositiveDisabled: object.colors.statusPositiveDisabled, statusNegative: object.colors.statusNegative
                )
            )
        } catch {
            throw error
        }
    }
    
    init(string: String) throws {
        do {
            let object = try CuvvaTheme.styleFromJSONString(string)
            self.init(
                fonts: CuvvaThemeFonts(
                    navigationTitle: object.fonts.navigationTitle, titleRegular: object.fonts.titleRegular, button: object.fonts.button,
                    body: object.fonts.body, bodyBold: object.fonts.bodyBold, bodyLight: object.fonts.bodyLight, bodySmall: object.fonts.bodySmall,
                    bodySmallBold: object.fonts.bodySmallBold, bodySmallLight: object.fonts.bodySmallLight),
                colors: CuvvaThemeColors(
                    primary: object.colors.primary, primaryVariant1: object.colors.primaryVariant1, primaryVariant2: object.colors.primaryVariant2,
                    primaryVariant3: object.colors.primaryVariant3, secondary: object.colors.secondary, secondaryVariant1: object.colors.secondaryVariant1,
                    secondaryVariant2: object.colors.secondaryVariant2, secondaryVariant3: object.colors.secondaryVariant3, tertiary: object.colors.tertiary,
                    tertiaryVariant1: object.colors.tertiaryVariant1, tertiaryVariant2: object.colors.tertiaryVariant2, tertiaryVariant3: object.colors.tertiaryVariant3,
                    clear: object.colors.clear, statusAlert: object.colors.statusAlert, statusPositive: object.colors.statusPositive,
                    statusPositiveDisabled: object.colors.statusPositiveDisabled, statusNegative: object.colors.statusNegative
                )
            )
        } catch {
            throw error
        }
    }
    
    //================================================================================
    // MARK: - Helpers
    //================================================================================
    
    fileprivate static func fromJson(_ json: [String: Any]?) throws -> CuvvaTheme {
        guard let json = json as? [String: NSDictionary] else { throw CuvvaThemeError.inValidJSON }
        
        return CuvvaTheme(
            fonts: CuvvaThemeFonts(
                navigationTitle: try? CuvvaFont(json: json[FontType.navigationTitle.rawValue] as? [String: Any]),
                titleRegular: try? CuvvaFont(json: json[FontType.titleRegular.rawValue] as? [String: Any]),
                button: try? CuvvaFont(json: json[FontType.button.rawValue] as? [String: Any]),
                body: try? CuvvaFont(json: json[FontType.body.rawValue] as? [String: Any]),
                bodyBold: try? CuvvaFont(json: json[FontType.bodyBold.rawValue] as? [String: Any]),
                bodyLight: try? CuvvaFont(json: json[FontType.bodyLight.rawValue] as? [String: Any]),
                bodySmall: try? CuvvaFont(json: json[FontType.bodySmall.rawValue] as? [String: Any]),
                bodySmallBold: try? CuvvaFont(json: json[FontType.bodySmallBold.rawValue] as? [String: Any]),
                bodySmallLight: try? CuvvaFont(json: json[FontType.bodySmallLight.rawValue] as? [String: Any])),
            colors: CuvvaThemeColors(
                primary: json[ThemeColor.primary.rawValue]?.color,
                primaryVariant1: json[ThemeColor.primaryVariant1.rawValue]?.color,
                primaryVariant2: json[ThemeColor.primaryVariant2.rawValue]?.color,
                primaryVariant3: json[ThemeColor.primaryVariant3.rawValue]?.color,
                secondary: json[ThemeColor.secondary.rawValue]?.color,
                secondaryVariant1: json[ThemeColor.secondaryVariant1.rawValue]?.color,
                secondaryVariant2: json[ThemeColor.secondaryVariant2.rawValue]?.color,
                secondaryVariant3: json[ThemeColor.secondaryVariant3.rawValue]?.color,
                tertiary: json[ThemeColor.tertiary.rawValue]?.color,
                tertiaryVariant1: json[ThemeColor.tertiaryVariant1.rawValue]?.color,
                tertiaryVariant2: json[ThemeColor.tertiaryVariant2.rawValue]?.color,
                tertiaryVariant3: json[ThemeColor.tertiaryVariant3.rawValue]?.color,
                clear: json[ThemeColor.clear.rawValue]?.color,
                statusAlert: json[ThemeColor.statusAlert.rawValue]?.color,
                statusPositive: json[ThemeColor.statusPositive.rawValue]?.color,
                statusPositiveDisabled: json[ThemeColor.statusPositiveDisabled.rawValue]?.color,
                statusNegative: json[ThemeColor.statusNegative.rawValue]?.color)
        )
    }
    
    fileprivate static func styleFromJSONString(_ string: String) throws -> CuvvaTheme {
        guard let data = string.data(using: .utf8) else { throw CuvvaThemeError.inValidJSONString }
        
        do {
            return try JSONDecoder().decode(CuvvaTheme.self, from: data)
        } catch {
            debugPrint(error)
            throw error
        }
    }
    
}

