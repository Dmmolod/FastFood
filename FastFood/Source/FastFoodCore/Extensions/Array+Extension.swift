//
//  Array+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import Foundation

extension Array where Element: Hashable {
    
    func removeDublicates() -> Array<Element> {
        var existValues: [Element: Void] = [:]
        
        return self.compactMap {
            
            guard existValues[$0] == nil else { return nil }
            
            existValues[$0] = ()
            return $0
        }
    }
}
