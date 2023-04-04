//
//  MenuView.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

final class MenuView: UIView {
    
    private let cityButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let menuCollection = MenuCollection()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .appBackground
        
        setupButton()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setPresenter(_ presenter: MenuCollectionPresenterProtocol) {
        menuCollection.presenter = presenter
    }
    
}

extension MenuView: MenuViewProtocol {
    func setData(_ data: [MenuData]) {
        menuCollection.setData(data)
    }
    
    func scroll(to indexPath: IndexPath) {
        menuCollection.scroll(to: indexPath)
    }
    
    func setCategories(titles: [String]) {
        menuCollection.setCategories(titles: titles)
    }
    
    func selectCategory(at index: Int) throws {
        try menuCollection.selectCategory(at: index)
    }
}

//MARK: - Private Layout
private extension MenuView {
    func setupButton() {
        //TODO: Remove HARDCODED
        let attributedTitle = NSAttributedString(
            string: "Москва",
            attributes: [
                .foregroundColor: UIColor.appBlack,
                .font: UIFont.mediumLarge
            ]
        )
        
        cityButton.setAttributedTitle(attributedTitle, for: .normal)
        cityButton.setImage(.arrowDown, for: .normal)
        
        let titleWidth = cityButton.attributedTitle(for: .normal)?.size().width ?? 0
        let imageWidth = cityButton.imageView?.image?.size.width ?? 0
        let spacing: CGFloat = 8
        
        cityButton.contentMode = .bottom
        cityButton.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageWidth - spacing/2,
            bottom: 0,
            right: imageWidth + spacing/2
        )
        cityButton.imageEdgeInsets = UIEdgeInsets(
            top: 3,
            left: titleWidth + spacing/2,
            bottom: 0,
            right: -titleWidth - spacing/2
        )
    }
    
    func setupLayout() {
        addSubview(cityButton) {
            $0.top.equalTo(snp.topMargin).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        addSubview(menuCollection) {
            $0.top.equalTo(cityButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
