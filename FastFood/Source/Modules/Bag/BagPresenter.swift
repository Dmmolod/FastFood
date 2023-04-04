//
//  BagPresenter.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

protocol BagPresenterProtocol { }

final class BagPresenter {
    
    weak var view: BagViewProtocol?
    
}

extension BagPresenter: BagPresenterProtocol { }
