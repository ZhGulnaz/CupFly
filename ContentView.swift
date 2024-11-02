import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager  // Подключаем CartManager
    
    var body: some View {
        NavigationView {
            VStack {
                // Отображаем меню кофе
                CoffeeMenu()
                
                // Переход к корзине с отображением количества товаров
                NavigationLink(destination: CartView()) {
                    Text("Go to Cart (\(cartManager.cartItems.count))") // Показываем количество товаров в корзине
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
            }
            .navigationTitle("Welcome to CupFly")
        }
    }
}
