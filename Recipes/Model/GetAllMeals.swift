//
//  GetAllMeals.swift
//  Recipes
//
//  Created by Diego 2 on 6/28/24.
//

import Foundation


struct GetAllMeals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
