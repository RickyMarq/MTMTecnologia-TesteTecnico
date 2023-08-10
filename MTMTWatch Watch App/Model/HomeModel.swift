//
//  HomeModel.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 04/08/23.
//

import Foundation
import SwiftUI

struct HomeModelList: Identifiable {
    let id = UUID()
    let name: String?
    let icon: String?
    let view: AnyView
}

struct HomeModel: Codable, Identifiable {
    var id: UUID?
    let info: Info
    let results: [ResultData]
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
}

struct ResultData: Codable, Identifiable {
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
