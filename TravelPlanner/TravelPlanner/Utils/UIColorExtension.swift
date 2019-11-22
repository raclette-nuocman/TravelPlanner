//
//  UIColorExtension.swift
//  TravelPlanner
//
//  Created by François Combe on 22/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        let hex: Int = Int(hexString.replacingOccurrences(of: "#", with: ""), radix: 16) ?? 0
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexInt: Int) {
        self.init(red: (hexInt >> 16) & 0xff, green: (hexInt >> 8) & 0xff, blue: hexInt & 0xff)
    }

    func toHexString() -> String {
        let colorComponents = components()
        let rgb: Int = (Int)(colorComponents.red * 255) << 16 | (Int)(colorComponents.green * 255) << 8 | (Int)(colorComponents.blue * 255) << 0
        return NSString(format: "#%06x", rgb) as String
    }
    
    /// Returns the rgba components of the color
    func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    static func color(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .unspecified, .light:
                    return light
                case .dark:
                    return dark
                @unknown default:
                    return light
                }
            }
        } else {
            return light
        }
    }

}
