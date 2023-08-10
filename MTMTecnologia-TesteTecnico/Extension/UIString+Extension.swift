//
//  UIString+Extension.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 06/08/23.
//

import Foundation

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
