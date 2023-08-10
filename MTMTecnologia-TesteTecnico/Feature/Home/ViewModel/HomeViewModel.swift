//
//  HomeViewModel.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation
import Alamofire

protocol HomeControllerViewModelProtocol: AnyObject {
    func success()
    func failure(error: String)
}

class HomeViewModel {
    
    var homeObjc: HomeModel?
    var objc: [ResultData] = []
    var service: HomeServiceProtocol
    var nextPage: String?
    weak var delegate: HomeControllerViewModelProtocol?
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }

    func delegate(delegate: HomeControllerViewModelProtocol) {
        self.delegate = delegate
    }
    
    func getData() {
        service.getCharacters { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.homeObjc = data
                self.nextPage = homeObjc?.info.next
                self.objc.append(contentsOf: self.homeObjc?.results ?? [])
                self.delegate?.success()
            case .failure(let failure):
                self.delegate?.failure(error: failure.localizedDescription)
            }
        }
    }
    
    func getMoreData(nextPage: String) {
        service.getMoreCharacters(nextPage: nextPage) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.homeObjc = data
                self.nextPage = homeObjc?.info.next
                self.objc.append(contentsOf: self.homeObjc?.results ?? [])
                self.delegate?.success()
            case .failure(let failure):
                self.delegate?.failure(error: failure.localizedDescription)
            }
        }
    }
    
    func reloadData() {
        service.getCharacters(completion: { [weak self] result in
            guard let self = self else {return}
            self.objc = []
            switch result {
            case .success(let data):
                self.objc = []
                self.homeObjc = data
                self.nextPage = homeObjc?.info.next
                self.objc.append(contentsOf: self.homeObjc?.results ?? [])
                self.delegate?.success()
            case .failure(let failure):
                self.delegate?.failure(error: failure.localizedDescription)
            }
        })
    }
    
    var count: Int {
        return objc.count
    }
    
    func indexPath(indexPath: IndexPath) -> ResultData? {
        return objc[indexPath.row]
    }
    
    var nextPageToLoad: String {
        return nextPage ?? ""
    }
}
