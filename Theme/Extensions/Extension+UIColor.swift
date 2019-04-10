//
//  Extension+UIColor.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class var random: UIColor {
        return UIColor(
            red: CGFloat(Double.random(in: 0..<256)),
            green: CGFloat(Double.random(in: 0..<256)),
            blue: CGFloat(Double.random(in: 0..<256)),
            alpha: 1)
    }
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var redComponent: CGFloat {
        var red: CGFloat = 0.0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        
        return red
    }
    
    var greenComponent: CGFloat {
        var green: CGFloat = 0.0
        getRed(&green, green: nil, blue: nil, alpha: nil)
        
        return green
    }
    
    var blueComponent: CGFloat {
        var blue: CGFloat = 0.0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        
        return blue
    }
    
    var alphaComponent: CGFloat {
        var alpha: CGFloat = 0.0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        
        return alpha
    }
    
}
