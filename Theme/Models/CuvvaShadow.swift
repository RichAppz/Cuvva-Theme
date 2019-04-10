//
//  CuvvaShadow.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 10/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

struct CuvvaShadow: Codable {
    
    let dx: CGFloat
    let dy: CGFloat
    let blurRadius: CGFloat
    let colorString: String?
    
    enum CodingKeys: String, CodingKey {
        case dx, dy, blurRadius
        case colorString = "color"
    }
    
}
