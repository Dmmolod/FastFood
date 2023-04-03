//
//  BagViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol BagViewProtocol: AnyObject { }

final class BagViewController: UIViewController {
    
    var presenter: BagPresenterProtocol?
    
    private let bagView = BagView()
    
    override func loadView() {
        view = bagView
    }
    
}

extension BagViewController: BagViewProtocol { }

