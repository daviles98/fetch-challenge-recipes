import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    
                    NavigationLink {
                        MealDetailView(meal: meal)
                    } label: {
                        MealRow(meal: meal)
                    }
                }
            }
            .navigationTitle("Desserts 🧁")
        }
        .onAppear {
            viewModel.getMeals()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}


#Preview {
    ContentView()
}

