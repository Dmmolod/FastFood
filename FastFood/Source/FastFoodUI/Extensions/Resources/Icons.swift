//
//  Icons.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UIImage {
    
    static let tabMenu = UIImage(named: "ic_menu")?
        .withTintColor(
            .appLightGray,
            renderingMode: .alwaysTemplate
        )
    
    static let tabProfile = UIImage(named: "ic_profile")?
        .withTintColor(
            .appLightGray,
            renderingMode: .alwaysTemplate
        )
    
    static let tabContacts = UIImage(named: "ic_contacts")?
        .withTintColor(
            .appLightGray,
            renderingMode: .alwaysTemplate
        )
    
    static let tabBag = UIImage(named: "ic_bag")?
        .withTintColor(
            .appLightGray,
            renderingMode: .alwaysTemplate
        )
    
    static let arrowDown = UIImage(named: "arrowDown")
}

//MARK: - Mock images
extension UIImage {
    
    static let pizza4cheeses = UIImage(named: "pizza4cheeses")
    static let pizzaBV = UIImage(named: "pizzaBV")
    static let pizzaFish = UIImage(named: "pizzaFish")
    static let pizzaHM = UIImage(named: "pizzaHM")
    
    static let cola = UIImage(named: "cola")
    static let sprite = UIImage(named: "sprite")
    static let pepsi = UIImage(named: "pepsi")
    
    static let honey = UIImage(named: "honey")
    static let croissant = UIImage(named: "croissant")
    static let cherryCake = UIImage(named: "cherryCake")
    
    static let bigCombo = UIImage(named: "bigCombo")
    static let mediumCombo = UIImage(named: "mediumCombo")
    
    static let banner1 = UIImage(named: "banner1")
    static let banner2 = UIImage(named: "banner2")
    static let banner3 = UIImage(named: "banner3")
}
