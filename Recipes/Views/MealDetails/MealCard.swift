//
//  MealCard.swift
//  Recipes
//
//  Created by Diego 2 on 6/28/24.
//

import SwiftUI

struct MealCard: View {
    
    let iconName: String
    let iconTxt: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
            Text(iconTxt)
        }
    }
}

#Preview {
    MealCard(iconName: "fork.knife", iconTxt: "Category")
}
