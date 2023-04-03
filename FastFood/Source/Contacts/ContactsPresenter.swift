//
//  ContactsPresenter.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

protocol ContactsPresenterProtocol { }

final class ContactsPresenter {
    
    weak var view: ContactsViewProtocol?
    
}

extension ContactsPresenter: ContactsPresenterProtocol { }
