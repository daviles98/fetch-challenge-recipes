import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    func getMeals() {
        MealAPI.shared.getMeals { result in
            DispatchQueue.main.async {
                print(result)
                
                switch result {
                case .success(let meals):
                    self.meals = meals
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
