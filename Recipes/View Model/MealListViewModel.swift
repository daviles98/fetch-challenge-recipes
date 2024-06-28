import SwiftUI

final class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var alertItem: AlertItem?
    
    func getMeals() {
        Network.shared.getMeals { result in
            DispatchQueue.main.async {
                print(result)
                switch result {
                case .success(let meals):
                    self.meals = meals
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidUrl
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .networkError:
                        self.alertItem = AlertContext.networkError
                        
                    case .invalidJson:
                        self.alertItem = AlertContext.invalidJson
                    }
                }
            }
        }
    }

}
