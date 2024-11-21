import SwiftUI

struct FoodListView: View {
    @StateObject private var foodService = FoodService()
    @State private var searchText = ""
    @State private var selectedFilter: Filter = .none
    
    enum Filter {
        case none, lowCalorie, highProtein
    }
    
    var filteredFoods: [Food] {
        let filtered = foodService.foods.filter {
            searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased())
        }
        switch selectedFilter {
        case .lowCalorie:
            return filtered.filter { $0.calories < 100 }
        case .highProtein:
            return filtered.filter { $0.protein > 10 }
        case .none:
            return filtered
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                HStack {
                    Button("All") { selectedFilter = .none }
                        .buttonStyle(FilterButtonStyle(selected: selectedFilter == .none))
                    Button("Low Calorie") { selectedFilter = .lowCalorie }
                        .buttonStyle(FilterButtonStyle(selected: selectedFilter == .lowCalorie))
                    Button("High Protein") { selectedFilter = .highProtein }
                        .buttonStyle(FilterButtonStyle(selected: selectedFilter == .highProtein))
                }
                .padding(.horizontal)
                
                if foodService.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(filteredFoods) { food in
                        NavigationLink(destination: FoodDetailView(food: food)) {
                            HStack {
                                Text(food.name)
                                    .font(.headline)
                                Spacer()
                                Text("\(Int(food.calories)) kcal")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .onAppear {
                foodService.fetchFoods(from: "https://example.com/api/foods") // Cambia el enlace por tu API
            }
            .navigationTitle("Foods")
        }
    }
}
