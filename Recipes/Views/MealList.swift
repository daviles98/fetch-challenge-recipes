import SwiftUI

struct MealList: View {
    
    @StateObject var viewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    
                    NavigationLink {
                        Text(meal.strMeal)
                    } label: {
                        MealLabelRow(meal: meal)
                    }
                }
            }
            .navigationTitle("Desserts 🧁")
        }
        .onAppear {
            viewModel.getMeals()
        }
    }
    
}

#Preview {
    MealList()
}
