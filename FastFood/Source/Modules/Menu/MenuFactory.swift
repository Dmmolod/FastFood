//
//  MenuFactory.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct MenuFactory {
    
    static func makeMenu() -> UIViewController {
        let menuApiClient = MenuApiClient()
        
        let presenter = MenuPresenter(menuApiClient: menuApiClient)
        let viewController = MenuViewController()
        
        presenter.view = viewController
        viewController.presenter =  presenter
        viewController.tabBarItem.configure(tab: .menu)
        
        return viewController
    }
    
}
