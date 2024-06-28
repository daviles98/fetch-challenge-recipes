import SwiftUI

struct MealDetail: View {
    
    @StateObject var viewModel = MealDetailViewModel()
    var meal: Meal
    
    var body: some View {
        ScrollView {
            VStack (alignment:.leading, spacing: 8) {
                if let meal = viewModel.mealDetails.first {
                    HeaderImage(imageUrl: meal.strMealThumb)
                    HStack(spacing: 16) {
                        MealCard(iconName: "fork.knife", iconTxt: meal.strCategory)
                        MealCard(iconName: "globe", iconTxt: meal.strArea)
                    }
                    .padding(.vertical)
                    
                    Text(meal.strInstructions)
                        .lineSpacing(5.0)
                }
                
            }
            .padding()
        }
        .navigationTitle(meal.strMeal)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getMealDetails(mealId: meal.idMeal)
        }
    }
}

#Preview {
    MealDetail(meal: Meal(
        strMeal: "Chocolate Caramel Crispy",
        strMealThumb: "https://www.themealdb.com/images/media/meals/1550442508.jpg",
        idMeal: "52966"))
}
