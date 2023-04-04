//
//  MenuViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

typealias MenuViewProtocol = MenuViewBaseProtocol
& MenuCategoriesViewProtocol
& MenuCollectionBaseViewProtocol

protocol MenuViewBaseProtocol: AnyObject { }

final class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterProtocol?
    
    private let menuView = MenuView()
    
    override func loadView() {
        view = menuView
        
        guard let presenter else { return }
        menuView.setPresenter(presenter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension MenuViewController: MenuViewBaseProtocol { }

extension MenuViewController: MenuCategoriesViewProtocol {
    
    func selectCategory(at index: Int) throws {
        try menuView.selectCategory(at: index)
    }
    
    func setCategories(titles: [String]) {
        menuView.setCategories(titles: titles)
    }
    
}

extension MenuViewController: MenuCollectionBaseViewProtocol {
    func scroll(to indexPath: IndexPath) {
        menuView.scroll(to: indexPath)
    }
    
    func setData(_ data: [MenuData]) {
        menuView.setData(data)
    }
}
