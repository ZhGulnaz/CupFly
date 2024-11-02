import SwiftUI

struct CoffeeMenu: View {
    var body: some View {
        NavigationView {
            VStack {
                // Отображаем CoffeeListView
                CoffeeListView()
                NavigationLink(destination: CartView()) {
                    Text("Go to Cart")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Coffee Menu")
        }
    }
}
