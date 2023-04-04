//
//  BannerCell.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

final class BannerCollectionCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func config(_ imageURL: URL?) {
        imageView.setImage(imageURL)
    }
}

//MARK: - Private Layout
private extension BannerCollectionCell {
    
    func setupLayout() {
        contentView.addSubview(imageView) {
            $0.edges.equalToSuperview()
        }
    }
}
