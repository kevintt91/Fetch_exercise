//
//  DessertViewModel.swift
//  FreeMeal
//
//  Created by Changhyun Kim on 4/24/23.
//

import Foundation

class DessertListViewModel: ObservableObject {
    
    @Published var desserts = [DessertViewModel]()
    
    let networking = Networking()
    let networkingTest: NetworkingProtocol
    
    init (networkingTest: NetworkingProtocol = Networking()) {
        self.networkingTest = networkingTest
    }
    
    func getAllDesserts() {
        networking.getAllDessert { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dessertss):
                    self?.desserts = dessertss.map(DessertViewModel.init)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

struct DessertViewModel {
    
    let dessert: Dessert
    
    var id: String {
        dessert.idMeal
    }
    
    var name: String {
        dessert.strMeal
    }
    
    var picture: String {
        dessert.strMealThumb
    }
    
}
