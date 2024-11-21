import SwiftUI

struct FoodDetailView: View {
    let food: Food
    
    var body: some 	View {
        VStack(alignment: .leading, spacing: 20) {
            Text(food.name)
                .font(.largeTitle)
                .bold()
            Text("Calories: \(Int(food.calories)) kcal")
            Text("Protein: \(food.protein, specifier: "%.1f") g")
            Text("Fat: \(food.fat, specifier: "%.1f") g")
            Text("Carbohydrates: \(food.carbs, specifier: "%.1f") g")
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}

