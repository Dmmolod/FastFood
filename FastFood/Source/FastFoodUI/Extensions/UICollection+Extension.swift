//
//  UICollection+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UICollectionView {
    
    func dequeueHeader<Header: UICollectionReusableView>(for indexPath: IndexPath) -> Header? {
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Header.reuseIdentifier,
            for: indexPath
        ) as? Header
    }
    
    func dequeue<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell? {
        return dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell
    }
    
    func register(_ cell: UICollectionViewCell.Type) {
        return register(cell, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    func register(_ header: UICollectionReusableView.Type) {
        return register(
            header,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: header.reuseIdentifier
        )
    }
}

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
