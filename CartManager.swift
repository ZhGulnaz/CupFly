
import Foundation
class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []  // Изменили тип для хранения CartItem
    
    // Метод для добавления товара с выбранным размером
    func addToCart(coffee: CoffeeItem, size: String) {
        let newItem = CartItem(coffee: coffee, size: size)
        cartItems.append(newItem)
    }
    
    // Метод для очистки корзины
    func clearCart() {
        cartItems.removeAll()
    }
}
