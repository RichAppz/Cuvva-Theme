//
//  Color.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

struct Color: Codable {
    
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
    let a: CGFloat
    
}

extension Color {
    
    init?(_ uiColor: UIColor?) {
        guard let rgba = uiColor?.rgba else { return nil }
        r = rgba.red
        g = rgba.green
        b = rgba.blue
        a = rgba.alpha
    }
    
    var value: UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
