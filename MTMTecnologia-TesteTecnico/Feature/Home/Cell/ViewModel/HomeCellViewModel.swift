//
//  HomeCellViewModle.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation

class HomeCellViewModel {
    
    var objc: ResultData
    
    init(objc: ResultData) {
        self.objc = objc
    }
    
    var name: String {
        return self.objc.name ?? ""
    }
    
    var image: String {
        return self.objc.image ?? ""
    }
    
    var alive: String {
        return self.objc.status ?? ""
    }
    
    var created: String {
        return self.objc.created ?? ""
    }
    
    var species: String {
        return self.objc.species ?? ""
    }
    
    public func convertCreated(_ date: String) -> String {
        let inputDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let outputDateFormat = "MMMM dd, yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputDateFormat
        dateFormatter.timeZone = TimeZone.current
        let location = Locale.current
        dateFormatter.locale = Locale(identifier: location.identifier)
        
        guard let convertedDate = dateFormatter.date(from: date) else {
            print("Invalid date format, setting default value.")
            return ""
        }
        
        dateFormatter.dateFormat = outputDateFormat
        let formattedTime = dateFormatter.string(from: convertedDate)
        return formattedTime
    }
    
    var locationName: String {
        return self.objc.origin.name ?? ""
    }
}
