//
//  ContactsFactory.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct ContactsFactory {
    
    static func makeContacts() -> UIViewController {
        let presenter = ContactsPresenter()
        let viewController = ContactsViewController()
        
        presenter.view = viewController
        viewController.presenter =  presenter
        viewController.tabBarItem.configure(tab: .contacts)
        
        return viewController
    }
    
}
