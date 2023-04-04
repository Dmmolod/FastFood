//
//  MenuPresenter.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

typealias MenuPresenterProtocol = MenuPresenterBaseProtocol
& MenuCategoriesPresenterProtocol
& MenuCollectionPresenterProtocol

protocol MenuPresenterBaseProtocol {
    func viewDidLoad()
}

final class MenuPresenter {
    
    weak var view: MenuViewProtocol?
    
    private let menuApiClient: MenuApiClientProtocol
    
    private(set) var categories: [String] = []
    private var products: [Product] = []
    private var currentOffset = 0
    private var menuData: [MenuData] = []
    
    init(menuApiClient: MenuApiClientProtocol) {
        self.menuApiClient = menuApiClient
    }
    
}

extension MenuPresenter: MenuPresenterBaseProtocol {
    func viewDidLoad() {
        menuApiClient.fetchMenu(offset: currentOffset) { [weak self] result in
            result
                .onSuccess { menuResponse in
                self?.didGetMenu(menuResponse)
                }.onFailure { error in
                print(error)
            }
        }
    }
}

extension MenuPresenter: MenuCategoriesPresenterProtocol {
    func categoryDidTap(at index: Int) {
        guard let menuSection = menuData.firstIndex(where: { $0.section == .menu }) else { return }
        guard categories.count > index else { return }
        
        let selectedCategory = categories[index]
        
        guard let firstIndexOfSelectedCategory = products.firstIndex(
            where: { $0.category == selectedCategory }
        ) else { return }
        
        view?.scroll(
            to: IndexPath(
                item: firstIndexOfSelectedCategory,
                section: menuSection
            )
        )
        
        try? view?.selectCategory(at: index)
    }
}

extension MenuPresenter: MenuCollectionBasePresenterProtocol {
    
    func didSelectItem(at indexPath: IndexPath) {
        //TODO: some feature
    }
    
    func topProductDidChanged(at indexPath: IndexPath) {
        let nextItem = indexPath.item + 1
        guard products.count > nextItem else { return }
        
        let nextCategory = products[nextItem].category
        
        guard let categoryIndex = categories.firstIndex(of: nextCategory) else { return }
        try? view?.selectCategory(at: categoryIndex)
    }
    
    func isNeedToRoundCorners(at indexPath: IndexPath) -> Bool {
        guard indexPath.section < menuData.count else { return false }
        
        let isMenuSection = menuData[indexPath.section].section == .menu
        return isMenuSection && indexPath.item == 0
    }
}

//MARK: - Private Helpers
extension MenuPresenter {
    
    private func didGetMenu(_ menu: MenuResponse) {
        products = menu.products.map { .converted($0) }
        categories = products.map { $0.category }.removeDublicates()
        currentOffset = menu.offset
        
        //TODO: Remove HARDCODED
        let bannerItems: [MenuSection.Item] = [
            .banner(URL(string: "banner1")),
            .banner(URL(string: "banner2")),
            .banner(URL(string: "banner3"))
        ]
        
        let menuItems: [MenuSection.Item] = products.map {
            .product($0.convertToProductCellModel())
        }
        
        menuData = [
            MenuData(
                section: .promo,
                items: bannerItems
            ),
            MenuData(
                section: .menu,
                items: menuItems
            )
        ]
        
        view?.setData(menuData)
        try? view?.selectCategory(at: 0)
    }
}
