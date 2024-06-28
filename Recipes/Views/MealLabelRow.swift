//
//  MealLabelRow.swift
//  Recipes
//
//  Created by Diego 2 on 6/28/24.
//

import SwiftUI

struct MealLabelRow: View {
    
    var meal: Meal
    
    var body: some View {
        HStack {
            Text(meal.strMeal)
        }
    }
}

#Preview {
    MealLabelRow(
        meal: Meal(
            strMeal: "Chocolate Caramel Crispy",
            strMealThumb: "https://www.themealdb.com/images/media/meals/1550442508.jpg",
            idMeal: "1")
    )
}
