//
//  BagFactory.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct BagFactory {
    
    static func makeBag() -> UIViewController {
        let presenter = BagPresenter()
        let viewController = BagViewController()
        
        presenter.view = viewController
        viewController.presenter =  presenter
        viewController.tabBarItem.configure(tab: .bag)
        
        return viewController
    }
    
}
