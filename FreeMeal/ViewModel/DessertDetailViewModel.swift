//
//  DessertDetailViewModel.swift
//  FreeMeal
//
//  Created by 김창현 on 4/24/23.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
    
    @Published  private var dessertDetail: DessertDetail?
    private var networking = Networking()
    
    func getDessertsById(id: String) {
        networking.getDessertBy(id: id) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.dessertDetail = details
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    init(dessertDetail: DessertDetail? = nil) {
        self.dessertDetail = dessertDetail
    }
    
    var desertTitle: String {
        self.dessertDetail?.strMeal ?? ""
    }
    
    var drinkAlt: String {
        self.dessertDetail?.strDrinkAlternate ?? ""
    }
    
    var area: String {
        self.dessertDetail?.strArea ?? ""
    }
    
    var instruction: String {
        self.dessertDetail?.strInstructions ?? ""
    }
    
    var dessertThumbnail: String {
        self.dessertDetail?.strMealThumb ?? ""
    }
    
    var youtubeLink: String {
        self.dessertDetail?.strYoutube ?? ""
    }
    
    var ingredients: [String] {
        self.dessertDetail?.available_ingredients ?? []
    }
    
    var measure: [String] {
        self.dessertDetail?.available_measures ?? []
    }
    
    var source: String {
        self.dessertDetail?.strSource ?? ""
    }
    
    var sourceImage: String {
        self.dessertDetail?.strImageSource ?? ""
    }
    
    var creativity: String {
        self.dessertDetail?.strCreativeCommonsConfirmed ?? ""
    }
    
    var date: String {
        self.dessertDetail?.dateModified ?? ""
    }
    
}
