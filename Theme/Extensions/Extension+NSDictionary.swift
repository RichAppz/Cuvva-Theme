//
//  Extension+NSDictionary.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

extension NSDictionary {
    
    var color: Color? {
        let red = self["r"] as? CGFloat ?? 0
        let green = self["g"] as? CGFloat ?? 0
        let blue = self["b"] as? CGFloat ?? 0
        let alpha = self["a"] as? CGFloat ?? 0
        return Color(UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha))
    }
    
}
