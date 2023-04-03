//
//  ViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppereance()
    }
    
    private func setupAppereance() {
        setupDivider()
        
        tabBar.tintColor = .appPink
        tabBar.backgroundColor = .white
    }

    private func setupDivider() {
        let divider = UIView()
        divider.backgroundColor = .gray.withAlphaComponent(0.4)
        
        tabBar.addSubview(divider) {
            $0.top.equalToSuperview().offset(-1)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}

