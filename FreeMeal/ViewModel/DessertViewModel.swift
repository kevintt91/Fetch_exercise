//
//  DessertViewModel.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import Foundation

class DessertListViewModel: ObservableObject {
    
    @Published var desserts = [DessertViewModel]()
    
    let networking = Networking()
    
    func getAllDesserts() {
        networking.getAllDessert { result in
            switch result {
            case .success(let dessertss):
                DispatchQueue.main.async {
                    self.desserts = dessertss.map(DessertViewModel.init)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
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
