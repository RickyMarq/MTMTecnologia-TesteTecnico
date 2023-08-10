//
//  OnboardingViewModel.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation

class OnboardingViewModel {
    
    var objc: [OnboardingDataModel] = []
    
    func populateObjc() {
        
        objc.append(contentsOf: [
            
            OnboardingDataModel(name: "Bem-vindo ao meu teste técnico.", image: "onboardingImage1", description: "Obrigado pela oportunidade."),
            
            OnboardingDataModel(name: "Vamos começar?", image: "onboardingImage2", description: "Pressione iniciar.")
            
        ])
        
    }
    
    var count: Int {
        return objc.count
    }
    
    func indexPath(indexPath: IndexPath) -> OnboardingDataModel {
        self.objc[indexPath.row]
    }
}
