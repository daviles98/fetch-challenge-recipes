import SwiftUI

struct MealList: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    
                    NavigationLink {
                        MealDetail(meal: meal)
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
