import Foundation

struct CoffeeItem: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let description: String
    let imageName: String
    let sizes: [String]  // Список доступных размеров (например, "Small", "Medium", "Large")
}

