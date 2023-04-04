//
//  ContactsViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol ContactsViewProtocol: AnyObject { }

final class ContactsViewController: UIViewController {
    
    var presenter: ContactsPresenterProtocol?
    
    private let contactsView = ContactsView()
    
    override func loadView() {
        view = contactsView
    }
    
}

extension ContactsViewController: ContactsViewProtocol { }
