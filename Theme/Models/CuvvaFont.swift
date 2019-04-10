//
//  CuvvaFont.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

struct CuvvaFont: Codable {
    
    let filename: String?
    let postScriptName: String
    let weight: String?
    let size: CGFloat
    let shadow: CuvvaShadow?
    
}
