//
//  CharacterViewModel.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation

class CharacterViewModel {
    
    var characterData: ResultData
    
    init(characterData: ResultData) {
        self.characterData = characterData
    }
    
    var characterId: Int {
        return characterData.id ?? 0
    }
    
    var characterName: String {
        return characterData.name ?? ""
    }
    
    var characterImage: String {
        return characterData.image ?? ""
    }
    
    var characterAlive: String {
        return characterData.status ?? ""
    }
    
    var characterGender: String {
        return characterData.gender ?? ""
    }
    
    var characterLocation: String {
        return characterData.location.name ?? ""
    }
    
    var characterOrigin: String {
        return characterData.origin.name ?? ""
    }
}
