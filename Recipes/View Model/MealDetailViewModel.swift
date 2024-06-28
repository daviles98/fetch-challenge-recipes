import SwiftUI

final class MealDetailViewModel: ObservableObject {
    @Published var mealDetails: MealDetail?
    @Published var alertItem: AlertItem?
    
    func getMealDetails(mealId: String) {
        Network.shared.getMealDetails(mealId: mealId) { result in
            DispatchQueue.main.async {
                print(result)
                switch result {
                case .success(let mealDetails):
                    self.mealDetails = mealDetails.first
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
    
    func extractTags() -> [Tag] {
        guard let tagList = mealDetails?.strTags?.split(separator: ",").map({Tag(name: String($0))}) else {
            return []
        }
        
        return tagList
    }
}

struct Tag: Identifiable {
    var id = UUID()
    var name: String
}
