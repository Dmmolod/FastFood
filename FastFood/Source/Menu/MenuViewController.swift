//
//  MenuViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol MenuViewProtocol: AnyObject { }

final class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterProtocol?
    
    private let menuView = MenuView()
    
    override func loadView() {
        view = menuView
    }
    
}

extension MenuViewController: MenuViewProtocol { }
