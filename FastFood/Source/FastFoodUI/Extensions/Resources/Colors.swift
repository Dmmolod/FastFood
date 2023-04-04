//
//  Colors.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UIColor {
    ///#E5E5E5
    static let appBackground = UIColor(r: 229.5, g: 229.5, b: 229.5, alpha: 1)
    
    ///#AAAAAD
    static let appGray = UIColor(r: 170, g: 170, b: 173, alpha: 1)
    
    ///#C3C4C9
    static let appLightGray = UIColor(r: 195, g: 196, b: 201, alpha: 1)
    
    ///#FD3A69
    static let appPink = UIColor(r: 253, g: 58, b: 105, alpha: 1)
    
    ///#222831
    static let appBlack = UIColor(r: 34, g: 40, b: 49, alpha: 1)
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
