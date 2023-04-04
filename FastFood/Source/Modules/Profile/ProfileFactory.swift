//
//  ProfileFactory.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct ProfileFactory {
    
    static func makeProfile() -> UIViewController {
        let presenter = ProfilePresenter()
        let viewController = ProfileViewController()
        
        presenter.view = viewController
        viewController.presenter =  presenter
        viewController.tabBarItem.configure(tab: .profile)
        
        return viewController
    }
    
}
