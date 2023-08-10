//
//  HomeModel.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation

struct HomeModel: Codable, Equatable {
    static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
        return true
    }
    let info: Info
    let results: [ResultData]
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
}

struct ResultData: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin
    let location: Location
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct Origin: Codable {
    let name: String?
}

struct Location: Codable {
    let name: String?
}

