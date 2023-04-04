//
//  MenuCategoriesView.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol MenuCategoriesPresenterProtocol {
    var categories: [String] { get }
    func categoryDidTap(at index: Int)
}

protocol MenuCategoriesViewProtocol {
    func selectCategory(at index: Int) throws
    func setCategories(titles: [String])
}

final class MenuCategoriesCollectionHeaderView: UICollectionReusableView {
    
    var presenter: MenuCategoriesPresenterProtocol? {
        didSet { setCategories(titles: presenter?.categories ?? []) }
    }
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.clipsToBounds = false
        scroll.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return scroll
    }()
    
    private let categoriesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        
        return stack
    }()
    
    private var categoryButtons: [MenuCategoryButton] = []
    private var previousSelected: MenuCategoryButton?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
        setupShadow()
        backgroundColor = .appBackground
    }
    
    required init?(coder: NSCoder) { nil }
    
    @objc
    private func categoryDidTap(_ category: MenuCategoryButton) {
        presenter?.categoryDidTap(at: category.tag)
    }
}

extension MenuCategoriesCollectionHeaderView: MenuCategoriesViewProtocol {
    
    func selectCategory(at index: Int) throws {
        guard index < categoryButtons.count else { throw NSError(domain: "Category not found", code: 0) }
        guard previousSelected != categoryButtons[index] else { throw NSError(domain: "Already selected", code: 1) }
        
        let newSelected = categoryButtons[index]
        
        previousSelected?.isSelected.toggle()
        newSelected.isSelected.toggle()
        
        previousSelected = newSelected
        scrollView.scrollRectToVisible(newSelected.frame, animated: true)
    }
    
    func setCategories(titles: [String]) {
        categoryButtons.forEach {
            categoriesStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        categoryButtons = []
        previousSelected = nil
        
        for (index, title) in titles.enumerated() {
            let category = MenuCategoryButton()
            category.tag = index
            category.setTitle(title, for: .normal)
            category.addTarget(self, action: #selector(categoryDidTap), for: .touchUpInside)
            
            categoryButtons.append(category)
            categoriesStackView.addArrangedSubview(category)
        }
    }
}

//MARK: - Private Layout
private extension MenuCategoriesCollectionHeaderView {
    
    func setupShadow() {
        layer.shadowColor = UIColor.appBlack.cgColor
        layer.shadowOpacity = 0
        
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowRadius = 3
    }
    
    func setupLayout() {
        addSubview(scrollView) {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
        }
        
        scrollView.addSubview(categoriesStackView) {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.height.equalTo(categoriesStackView).priority(.high)
        }
    }
}
