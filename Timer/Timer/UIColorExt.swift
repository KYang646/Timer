//
//  UIColorExt.swift
//  Timer
//
//  Created by Kimball Yang on 3/29/20.
//  Copyright © 2020 Kimball Yang. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        let redValue: CGFloat   = .random(in: 0...1)
        let greenValue: CGFloat   = .random(in: 0...1)
        let blueValue: CGFloat   = .random(in: 0...1)
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}

