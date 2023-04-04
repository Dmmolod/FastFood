//
//  ProfilePresenter.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

protocol ProfilePresenterProtocol { }

final class ProfilePresenter {
    
    weak var view: ProfileViewProtocol?
    
}

extension ProfilePresenter: ProfilePresenterProtocol { }
