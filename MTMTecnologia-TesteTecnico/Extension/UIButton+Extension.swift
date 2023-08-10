//
//  UIButton+Extension.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 06/08/23.
//

import Foundation
import UIKit

extension UIButton {
    
    enum ButtonStyleAppearance {
        case primary
    }
    
    func setButtonDesign(layout: ButtonStyleAppearance) {
        switch layout {
            
        case .primary:
            translatesAutoresizingMaskIntoConstraints = false
            tintColor = .white
            backgroundColor = .systemPurple
            layer.borderColor = UIColor.systemPurple.cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 15
            layer.shadowColor = UIColor.systemPurple.cgColor
            layer.shadowOffset = CGSize(width: 1, height: 1)
            layer.shadowRadius = 1.5
            layer.shadowOpacity = 1
            layer.masksToBounds = false
            setTitleColor(.white, for: .normal)
        }
    }
}

