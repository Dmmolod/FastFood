//
//  UITabBarItem+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UITabBarItem {
    func configure(tab: Tab) {
        setTitleTextAttributes(
            [.font: UIFont.regularNormal],
            for: .normal
        )
        
        title = tab.title
        image = tab.image
    }
}
