import SwiftUI

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
            
            if cartManager.cartItems.isEmpty {
                Text("Your cart is empty")
                    .font(.title2)
                    .padding()
            } else {
                List {
                    ForEach(cartManager.cartItems, id: \.id) { cartItem in
                        HStack {
                            Image(cartItem.coffee.imageName) // Используем imageName из CartItem
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text(cartItem.coffee.name) // Название кофе
                                Text("Price: \(cartItem.coffee.price, specifier: "%.2f")$") // Цена кофе
                                    .font(.subheadline)
                                Text("Size: \(cartItem.size)") // Размер кофе
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                deleteItem(cartItem) // Удаляем элемент
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    }
                }
                
                NavigationLink(destination: PaymentView()) {
                    Text("Proceed to Payment")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Cart")
    }
    
    // Функция для удаления выбранного товара
    func deleteItem(_ cartItem: CartItem) {
        if let index = cartManager.cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            cartManager.cartItems.remove(at: index)
        }
    }
}
        
