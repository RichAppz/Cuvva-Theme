//
//  Extension+CuvvaShadow.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 10/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

extension CuvvaShadow {
    
    var color: UIColor? {
        return colorString?.color
    }
    
    var offset: CGSize {
        return CGSize(width: dx, height: dy)
    }
    
}
