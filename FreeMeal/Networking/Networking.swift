//
//  Networking.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import Foundation

protocol NetworkingProtocol {
    func getAllDessert(completion: @escaping (Result<[Dessert], NetworkError>) -> Void)
}

enum NetworkError: Error {
    case badURL
    case decodingError
    case NoDataFound
}

class Networking: NetworkingProtocol {
    
    func getAllDessert(completion: @escaping (Result<[Dessert], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.NoDataFound))
            }
            
            guard let dessertResponse = try? JSONDecoder().decode(DessertResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(dessertResponse.meals))
            
        }.resume()
    }
    
    func getDessertBy(id: String, completion: @escaping (Result<DessertDetail, NetworkError>) -> Void) {
        
        guard let url = URL.forDessertBy(id) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.NoDataFound))
            }
            
            guard let dessertDetailResponse = try? JSONDecoder().decode(DessertDetailResponse.self, from: data),
                  let dessertDetail = dessertDetailResponse.meals.first else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(dessertDetail))
            
        }.resume()
    }
    
}
