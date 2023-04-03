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
}

extension UIFont {
    
    static func SFUIDisplayRegular(size: CGFloat) -> UIFont {
        UIFont(name: "SFUIDisplay-Regular", size: size)!
    }
}
