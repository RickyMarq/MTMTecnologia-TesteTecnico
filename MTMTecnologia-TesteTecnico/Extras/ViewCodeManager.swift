//
//  ViewCodeManager.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import UIKit

public protocol ViewCode {
    func initViewCode()
    func configureSubViews()
    func configureConstraints()
    func configureAdditionalBehaviors()
    func configureAccessibility()
}

public extension ViewCode {
    func initViewCode() {
        configureSubViews()
        configureConstraints()
        configureAdditionalBehaviors()
        configureAccessibility()
    }
}

