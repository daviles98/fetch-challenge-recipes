import Foundation

struct MealResponse: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
