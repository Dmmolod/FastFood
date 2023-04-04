//
//  Product.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

struct Product: Hashable {
    let title: String
    let category: String
    let description: String
    let imageURL: URL?
    let startPrice: Int
}

extension Product {
    static func converted(_ model: ProductResponse) -> Product {
        Product(
            title: model.title,
            category: model.category,
            description: model.description,
            imageURL: URL(string: model.imageURLString ?? ""),
            startPrice: model.startPrice
        )
    }
}

extension Product {
    func convertToProductCellModel() -> ProductCollectionCell.Model {
        ProductCollectionCell.Model(
            title: title,
            description: description,
            priceText: "от \(startPrice)",
            imageURL: imageURL
        )
    }
}
