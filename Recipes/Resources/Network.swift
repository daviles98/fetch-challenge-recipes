import Foundation

final class Network {
    
    
    static let shared = Network()
    
    static let baseUrl = "https://themealdb.com/api/json/v1/1"
    let mealsUrl = baseUrl + "/filter.php?c=Dessert"
    let mealDetailUrl = baseUrl + "/lookup.php"
    
    
    private init() {}
    
    func getMeals(completed: @escaping (Result<[Meal], NetworkError>) -> Void) {
        
        guard let url = URL(string: mealsUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.networkError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
                        
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
                        
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MealResponse.self, from: data)
                
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidJson))
            }
        }
        
        task.resume()
        
    }
    
    func getMealDetails(mealId: String, completed: @escaping (Result<[MealDetail], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(mealDetailUrl)?i=\(mealId)") else {
            completed(.failure(.invalidURL))
            return
        }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.networkError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            print(data)
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MealDetailResponse.self, from: data)
                completed(.success(decodedResponse.meals))
            } catch {
                completed(.failure(.invalidJson))
            }
        }
        
        task.resume()
        
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case networkError
    case invalidJson
}
