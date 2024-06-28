import Foundation

class MealDetailViewModel: ObservableObject {
    
    @Published var mealDetails: [MealDetails] = []
    
    func getMealDetails(mealId: String) {
        MealAPI.shared.getMealDetails(mealId: mealId) { result in
            DispatchQueue.main.async {
                print(result)
                
                switch result {
                case .success(let mealDetails):
                    self.mealDetails = mealDetails
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
