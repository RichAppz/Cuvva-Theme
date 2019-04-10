//
//  Extension+CuvvaFont.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

public var kSystemFont: String { return "System" }

extension CuvvaFont {
    
    //================================================================================
    // MARK: - Initialization
    //================================================================================
    
    init(string: String) throws {
        do {
            let object = try CuvvaFont.styleFromJSONString(string)
            self.init(
                filename: object.filename,
                postScriptName: object.postScriptName,
                weight: object.weight,
                size: object.size,
                shadow: object.shadow
            )
        } catch {
            throw error
        }
    }
    
    init(json: [String: Any]?) throws {
        do {
            let object = try CuvvaFont.styleFromJSON(json)
            self.init(
                filename: object.filename,
                postScriptName: object.postScriptName,
                weight: object.weight,
                size: object.size,
                shadow: object.shadow
            )
        } catch {
            throw error
        }
    }
    
    init(scriptName: String = kSystemFont, size: CGFloat = 12, weight: UIFont.Weight = .regular) {
        var font = UIFont.systemFont(ofSize: size, weight: weight)
        if
            let customFont = UIFont(name: scriptName, size: size),
            scriptName != kSystemFont {
            font = customFont
        }
        
        self.init(
            filename: nil,
            postScriptName: font.fontName,
            weight: nil,
            size: size,
            shadow: nil
        )
    }
    
    //================================================================================
    // MARK: - Helpers
    //================================================================================
    
    var font: UIFont {
        if let weight = weight?.fontWeight, postScriptName == kSystemFont {
            return UIFont.systemFont(ofSize: size, weight: weight)
        } else {
            return UIFont(name: postScriptName, size: size) ?? UIFont()
        }
        
    }
    
    static var defaultStyle: CuvvaFont {
        return CuvvaFont()
    }
    
    fileprivate static func styleFromJSON(_ json: [String: Any]?) throws -> CuvvaFont {
        guard let json = json else { throw CuvvaThemeError.inValidJSON }
        
        let filename: String? = json[JSONVariable.filename.rawValue] as? String
        let weight: String? = json[JSONVariable.weight.rawValue] as? String
        let scriptName: String = json[JSONVariable.postScriptName.rawValue] as? String ?? kSystemFont
        let size: CGFloat = json[JSONVariable.size.rawValue] as? CGFloat ?? 0
        
        var shadowOffset: CGSize = .zero
        var shadowBlurRadius: CGFloat = 0
        var shadowColor: String?
        
        if let shadowJSON = json[JSONVariable.shadow.rawValue] as? NSDictionary {
            shadowBlurRadius = shadowJSON[JSONVariable.blurRadius.rawValue] as? CGFloat ?? 0
            shadowColor = shadowJSON[JSONVariable.color.rawValue] as? String
            
            if
                let dx = shadowJSON[JSONVariable.dx.rawValue] as? CGFloat,
                let dy = shadowJSON[JSONVariable.dy.rawValue] as? CGFloat {
                shadowOffset = CGSize(width: dx, height: dy)
            }
        }
        
        return CuvvaFont(
            filename: filename,
            postScriptName: scriptName,
            weight: weight,
            size: size,
            shadow: CuvvaShadow(
                dx: shadowOffset.width,
                dy: shadowOffset.height,
                blurRadius: shadowBlurRadius,
                colorString: shadowColor)
        )
    }
    
    fileprivate static func styleFromJSONString(_ string: String) throws -> CuvvaFont {
        guard let data = string.data(using: .utf8) else { throw CuvvaThemeError.inValidJSONString }
        
        do {
            return try JSONDecoder().decode(CuvvaFont.self, from: data)
        } catch {
            debugPrint(error)
            throw error
        }
    }
    
}
