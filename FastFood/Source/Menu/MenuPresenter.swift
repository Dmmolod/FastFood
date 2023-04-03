//
//  MenuPresenter.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

protocol MenuPresenterProtocol { }

final class MenuPresenter {
    
    weak var view: MenuViewProtocol?
    
}

extension MenuPresenter: MenuPresenterProtocol { }
