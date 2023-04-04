//
//  ProductCell.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

final class ProductCollectionCell: UICollectionViewCell  {
    
    enum Constant {
        static let imageSize: CGFloat = 132
        static let imageTopOffset: CGFloat = 16
        static let imageLeadingOffset: CGFloat = 16
        static let imageBottomInset = 16
        
        static let titleTopOffset = 22
        static let titleLeadingOffset = 32
        static let titleTrailingInset = 24
        
        static let descriptionTopOffset = 8
        
        static let addButtonTopOffset = 16
        static let addButtonTrailingInset = 24
        static let addButtonBottomInset = 16
    }
    
    struct Model: Hashable {
        let title: String
        let description: String
        let priceText: String
        let imageURL: URL?
    }
    
    private let imageView = UIImageView()
    private let titleLable = UILabel()
    private let descriptionLable = UILabel()
    private let addToBagButton = UIButton()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray.withAlphaComponent(0.6)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupAppereance()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }

    func config(_ model: Model) {
        imageView.setImage(model.imageURL)
        setTitleLableText(model.title)
        setDescriptionText(model.description)
        setAddToBagButtonTitle(model.priceText)
    }
    
    func roundedCorners(_ isNeed: Bool) {
        layer.cornerRadius = isNeed ? 20 : 0
        layer.maskedCorners = isNeed ? [.layerMinXMinYCorner, .layerMaxXMinYCorner] : []
    }
}

//MARK: - Private Helpers
private extension ProductCollectionCell {
    func setTitleLableText(_ text: String) {
        let attributedText = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.appBlack,
                .font: UIFont.semiboldLarge
            ]
        )
        
        titleLable.attributedText = attributedText
    }
    
    func setDescriptionText(_ text: String) {
        let attributedText = NSAttributedString(
            string: text,
            attributes: [
                .foregroundColor: UIColor.appGray,
                .font: UIFont.regularNormal
            ]
        )
        descriptionLable.attributedText = attributedText
    }
    
    func setAddToBagButtonTitle(_ text: String) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [.font: UIFont.regularNormal]
        )
        
        addToBagButton.setAttributedTitle(attributedString, for: .normal)
    }
}

//MARK: - Private Layout
private extension ProductCollectionCell {
    func setupAppereance() {
        
        descriptionLable.numberOfLines = 0
        
        addToBagButton.layer.borderWidth = 1
        addToBagButton.layer.borderColor = UIColor.appPink.cgColor
        addToBagButton.layer.cornerRadius = 6
        
        addToBagButton.backgroundColor = .clear
        addToBagButton.setTitleColor(.appPink, for: .normal)
        addToBagButton.contentEdgeInsets = UIEdgeInsets(
            top: 8,
            left: 18,
            bottom: 8,
            right: 18
        )
    }
    
    func setupLayout() {
        contentView.addSubview(imageView) {
            $0.top.equalToSuperview().offset(Constant.imageTopOffset)
            $0.bottom.lessThanOrEqualToSuperview().inset(Constant.imageBottomInset).priority(.low)
            $0.leading.equalToSuperview().offset(Constant.imageLeadingOffset)
            $0.width.equalTo(Constant.imageSize)
            $0.height.equalTo(Constant.imageSize)
        }
        
        contentView.addSubview(titleLable) {
            $0.top.equalToSuperview().offset(Constant.titleTopOffset)
            $0.leading.equalTo(imageView.snp.trailing).offset(Constant.titleLeadingOffset)
            $0.trailing.equalToSuperview().inset(Constant.titleTrailingInset)
        }
        
        contentView.addSubview(descriptionLable) {
            $0.top.equalTo(titleLable.snp.bottom).offset(Constant.descriptionTopOffset)
            $0.leading.trailing.equalTo(titleLable)
        }
        
        contentView.addSubview(addToBagButton) {
            $0.top.equalTo(descriptionLable.snp.bottom).offset(Constant.addButtonTopOffset)
            $0.trailing.equalToSuperview().inset(Constant.addButtonTrailingInset)
            $0.bottom.lessThanOrEqualToSuperview().inset(Constant.addButtonBottomInset).priority(.high)
        }
        
        contentView.addSubview(divider) {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
