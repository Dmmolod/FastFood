//
//  ProfileViewController.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

protocol ProfileViewProtocol: AnyObject { }

final class ProfileViewController: UIViewController {
    
    var presenter: ProfilePresenterProtocol?
    
    private let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
}

extension ProfileViewController: ProfileViewProtocol { }
