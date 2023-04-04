//
//  Fonts.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UIFont {
    
    ///weight: 400, size: 13
    static let regularNormal = SFUIDisplayRegular(size: 13)
    
    ///weight: 600, size: 17
    static let semiboldLarge = SFUIDisplaySemibold(size: 17)
    
    ///weight: 500, size: 17
    static let mediumLarge = SFUIDisplayMedium(size: 17)
}

extension UIFont {
    
    static func SFUIDisplayRegular(size: CGFloat) -> UIFont {
        UIFont(name: "SFUIDisplay-Regular", size: size)!
    }
    
    static func SFUIDisplaySemibold(size: CGFloat) -> UIFont {
        UIFont(name: "SFUIDisplay-Semibold", size: size)!
    }
    
    static func SFUIDisplayMedium(size: CGFloat) -> UIFont {
        UIFont(name: "SFUIDisplay-Medium", size: size)!
    }
}
