//
//  Result+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

extension Result {
    
    @discardableResult
    func onSuccess(_ closure: (Success) -> ()) -> Self {
        guard case let .success(success) = self else { return self }
        
        closure(success)
        return self
    }
    
    @discardableResult
    func onFailure(_ closure: (Failure) -> ()) -> Self {
        guard case let .failure(failure) = self else { return self }
        
        closure(failure)
        return self
    }
}
