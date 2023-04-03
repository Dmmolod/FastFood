//
//  UIVIew+Extension.swift
//  FastFood
//
//  Created by Дмитрий Молодецкий on 03.04.2023.
//

import UIKit
import SnapKit

extension UIView {
    
    func addSubview(_ view: UIView, layout: (ConstraintMaker) -> ()) {
        addSubview(view)
        view.snp.makeConstraints(layout)
    }
    
}
