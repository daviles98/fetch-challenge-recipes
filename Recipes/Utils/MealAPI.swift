import Foundation

final class MealAPI {
    
    static let shared = MealAPI()
    
    static let baseUrl = "https://themealdb.com/api/json/v1/1"
    
    let mealsUrl = baseUrl + "/filter.php?c="
    let mealDetailUrl = baseUrl + "/lookup.php?i="
    
    func getMeals(mealCategory: String = "Dessert", completed: @escaping (Result<[Meal], ApiError>) -> Void) {
        
        guard let url = URL(string: "\(mealsUrl)\(mealCategory)") else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(GetAllMeals.self, from: data)
                
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidJson))
            }
            
        }
        
        task.resume()
    }
    
    func getMealDetails(mealId: String, completed: @escaping (Result<[MealDetails], ApiError>) -> Void) {
        
        guard let url = URL(string: "\(mealDetailUrl)\(mealId)") else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(GetMealDetails.self, from: data)
                
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidJson))
            }
            
        }
        
        task.resume()
    }
}
