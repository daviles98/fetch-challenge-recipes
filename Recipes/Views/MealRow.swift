//
//  MealRow.swift
//  Recipes
//
//  Created by Diego 2 on 6/27/24.
//

import SwiftUI

struct MealRow: View {
    
    let meal: Meal
        
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image.resizable()
                default:
                    ProgressView()
                }
            }
            .frame(width: 64, height: 64)
            .padding(.horizontal)
            
            
            
            Text(meal.strMeal)
                .font(.title2)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

#Preview {
    MealRow(meal: Meal(strMeal: "Creme Brulee", strMealThumb: "", idMeal: ""))
}
