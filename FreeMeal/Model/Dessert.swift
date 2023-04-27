//
//  Dessert.swift
//  FreeMeal
//
//  Created by Changhyun Kim on 4/24/23.
//

import Foundation

struct DessertResponse: Codable {
    let meals: [Dessert]
}

struct Dessert: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
