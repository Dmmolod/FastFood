//
//  UIImageView+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit

extension UIImageView {
    
    func setImage(_ url: URL?) {
        guard let url else { return }
        
        //MARK: This could be "Kingfisher"
        let mockImagePath = url.absoluteString
        let mockImage = UIImage(named: mockImagePath)
        
        self.image = mockImage
    }
}
