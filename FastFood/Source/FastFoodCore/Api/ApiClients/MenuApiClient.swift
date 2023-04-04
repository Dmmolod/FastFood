//
//  MenuApiClient.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

protocol MenuApiClientProtocol {
    func fetchMenu(offset: Int, completion: @escaping (Result<MenuResponse, ApiError>) -> ())
}

struct MenuApiClient {
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient = ApiClient()) {
        self.apiClient = apiClient
    }
}

extension MenuApiClient: MenuApiClientProtocol {
    func fetchMenu(offset: Int, completion: @escaping (Result<MenuResponse, ApiError>) -> ()) {
        DispatchQueue.global().asyncAfter(wallDeadline: .now() + 0.5) {
            
            let menu = MockMenuResponseModel.menuResponse
            
            DispatchQueue.main.async {
                completion(.success(menu))
            }
        }
    }
}
