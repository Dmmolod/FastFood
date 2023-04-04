//
//  TabBarFactory.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

struct TabBarFactory {
    
    static func makeTabBar() -> UITabBarController {
        let menuVC = MenuFactory.makeMenu()
        let contactsVC = ContactsFactory.makeContacts()
        let profileVC = ProfileFactory.makeProfile()
        let bagVC = BagFactory.makeBag()
        
        let tabBarVC = TabBarController()
        tabBarVC.viewControllers = [
            menuVC,
            contactsVC,
            profileVC,
            bagVC
        ]
        
        return tabBarVC
    }
    
}
