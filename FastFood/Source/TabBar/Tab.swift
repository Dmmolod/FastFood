//
//  Tab.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct Tab {
    let title: String?
    let image: UIImage?
}

extension Tab {
    static let menu = Tab(title: "Меню", image: .tabMenu)
    static let contacts = Tab(title: "Контакты", image: .tabContacts)
    static let profile = Tab(title: "Профиль", image: .tabProfile)
    static let bag = Tab(title: "Корзина", image: .tabBag)
}
