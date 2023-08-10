//
//  WebServicesClass.swift
//  MTMTecnologia-TesteTecnico
//
//  Created by Henrique Marques on 03/08/23.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol: AnyObject {
    func getCharacters(completion: @escaping (Result<HomeModel, Error>) -> Void)
    func getMoreCharacters(nextPage: String, completion: @escaping (Result<HomeModel, Error>) -> Void)
}

class HomeService: HomeServiceProtocol {
    
    func getCharacters(completion: @escaping (Result<HomeModel, Error>) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}
        
        AF.request(url, method: .get).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(HomeModel.self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMoreCharacters(nextPage: String, completion: @escaping (Result<HomeModel, Error>) -> Void) {
        guard let url = URL(string: nextPage) else {return}
        
        AF.request(url, method: .get).response { response in
            
            switch response.result {
                
            case .success(let data):
                guard let data = data else {return}
                print(data)
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(HomeModel.self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
