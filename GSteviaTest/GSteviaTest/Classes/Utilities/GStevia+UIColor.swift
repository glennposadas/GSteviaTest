//
//  GStevia+UIColor.swift
//  GSteviaTest
//
//  Created by Glenn Posadas on 04/09/2016.
//  Copyright © 2016 Citus Lab, Inc. All rights reserved.
//


import UIKit

struct GSteviaColor {
    struct color {
        static let blueTintColor = UIColor.colorWithRGBHex(0x8fc2fb)
        static let readGrayLabelColor = UIColor.colorWithRGBHex(0xc1c1c1)
        static let navigationBarGrayColor = UIColor.colorWithRGBHex(0xf6f6f6)
    }
}

extension UIColor {
    class func colorWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
    }
}