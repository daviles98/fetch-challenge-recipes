import SwiftUI

struct ContentView: View {
    
    @State private var mealResponse: MealResponse?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mealResponse?.meals ?? [], id: \.idMeal) { meal in
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                                switch phase {
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                case .success(let image):
                                    image.resizable()
                                default:
                                    ProgressView()
                                }
                            }
                            .frame(width: 64, height: 64)
                            .padding(.horizontal)
                            
                            
                            
                            Text(meal.strMeal)
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
        }
        .padding(.bottom)
        .task {
            do {
                mealResponse = try await getMeals()
                print(mealResponse)
            } catch NetworkError.invalidData {
                print("invalid data")
            } catch NetworkError.invalidResponse {
                print("invalid response")
            } catch NetworkError.invalidURL {
                print("invalid url")
            } catch {
                print ("unexpected error")
            }
        }
    }
    
    func getMeals() async throws -> MealResponse {
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        print(data)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(MealResponse.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
        
    }
    
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

#Preview {
    ContentView()
}

