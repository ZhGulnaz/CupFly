//
//  CardRegistrationView.swift
//  CupFly
//
//  Created by Gulnaz Zhakhina on 10.11.2024.
//

import Foundation
import SwiftUI

struct OrderSummaryView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var isNavigatingToPayment = false
    
    var body: some View {
        VStack {
            Text("Order Summary")
                .font(.largeTitle)
                .padding()

            // Отображение товаров в корзине
            List(cartManager.cartItems, id: \.id) { cartItem in
                HStack {
                    Text(cartItem.coffee.name)
                    Spacer()
                    Text("\(cartItem.size) - $\(cartItem.price, specifier: "%.2f")")
                }
            }
            
            // Кнопка перехода к регистрации карты
            NavigationLink(destination: CardRegistrationView(), isActive: $isNavigatingToPayment) {
                Button(action: {
                    // Логика перехода на страницу регистрации карты
                    isNavigatingToPayment = true
                }) {
                    Text("Proceed to Payment")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationTitle("Checkout")
        .padding()
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView()
            .environmentObject(CartManager())
    }
}
