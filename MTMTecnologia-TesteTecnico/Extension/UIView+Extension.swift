//
//  UIView+Extension.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation
import UIKit

extension UIView {
    
    public func setShadow(view: UIView) {
        view.layer.cornerRadius = 12.0
        view.layer.borderWidth = 0.0
        view.layer.shadowColor = UIColor.secondarySystemBackground.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 1.0
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
    }
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        var cornerMask = CACornerMask()
        if(corners.contains(.topLeft)) {
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if(corners.contains(.topRight)) {
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if(corners.contains(.bottomLeft)) {
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if(corners.contains(.bottomRight)) {
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
}
