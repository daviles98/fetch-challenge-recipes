import SwiftUI

struct MealDetailView: View {
    
    let meal: Meal
    @StateObject var viewModel = MealDetailViewModel()
    
    
    var body: some View {
        
        let mealDetails = viewModel.mealDetails
        
        ScrollView {
    
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    ForEach(viewModel.extractTags()) { tag in
                        Text(tag.name)
                            .padding(4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack (alignment: .lastTextBaseline, spacing: 24) {
                    VStack {
                        Image(systemName: "fork.knife")
                        Text("\(mealDetails?.strCategory ?? "")")
                    }
                    VStack {
                        Image(systemName: "globe")
                        Text("\(mealDetails?.strArea ?? "")")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                DisclosureGroup("Ingredients") {
                    Text("\(mealDetails?.strInstructions ?? "")")
                }
                .font(.headline)
                .padding(.vertical)
                
                Text(mealDetails?.strInstructions ?? "")
                    .font(.body)
            }
            .padding()
            
            

            
        }
        .navigationTitle(meal.strMeal)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getMealDetails(mealId: meal.idMeal)
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    MealDetailView(meal: Meal(
        strMeal: "Apple & Blackberry Crumble",
        strMealThumb: "https://www.themealdb.com/images/media/meals/y4jpgq1560459207.jpg",
        idMeal: "52931")
    )
}
