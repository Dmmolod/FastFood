//
//  MenuCollection.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 04.04.2023.
//

import Foundation

enum MenuSection: Hashable {
    case promo
    case menu
    
    enum Item: Hashable {
        case banner(URL?)
        case product(ProductCollectionCell.Model)
    }
}

struct MenuData: Hashable {
    let section: MenuSection
    let items: [MenuSection.Item]
}
