import Foundation

class FoodService: ObservableObject {
    @Published var foods: [Food] = []
    @Published var isLoading = false

    func fetchFoods(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        isLoading = true

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                guard let data = data else { return }
                do {
                    self.foods = try JSONDecoder().decode([Food].self, from: data)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
