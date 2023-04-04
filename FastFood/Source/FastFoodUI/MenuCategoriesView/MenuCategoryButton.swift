//
//  MenuCategoryButton.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

final class MenuCategoryButton: UIButton {
    
    enum Constant {
        static let height: CGFloat = 32
        static let defaulColor = UIColor.appPink.withAlphaComponent(0.4)
        static let selectedColor = UIColor.appPink
        static let selectedBackgroundColor = UIColor.appPink.withAlphaComponent(0.2)
    }
    
    override var isSelected: Bool {
        didSet { setStyleForSelected() }
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func configure() {
        setupLayout()
        setupTitleAppereance()
        setDefaultStyle()
        layer.cornerRadius = Constant.height/2
    }
   
}

//MARK: - Private Helpers
private extension MenuCategoryButton {
    
    func setupTitleAppereance() {
        contentEdgeInsets = .init(top: 8, left: 24, bottom: 8, right: 24)
        setTitleColor(Constant.defaulColor, for: .normal)
        setTitleColor(Constant.selectedColor, for: .selected)
    }
    
    func setDefaultStyle() {
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = Constant.defaulColor.cgColor
    }
    
    func setSelectedStyle() {
        backgroundColor = Constant.selectedBackgroundColor
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    func setStyleForSelected() {
        if isSelected { setSelectedStyle() }
        else { setDefaultStyle() }
    }
}

//MARK: - Private Layout
private extension MenuCategoryButton {
    
    func setupLayout() {
        snp.makeConstraints {
            $0.height.equalTo(Constant.height)
        }
    }
}
