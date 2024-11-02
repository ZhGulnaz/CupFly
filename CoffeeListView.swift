import SwiftUI

struct CoffeeListView: View {
    @EnvironmentObject var cartManager: CartManager
    
    let coffeeList: [CoffeeItem] = [
        CoffeeItem(name: "Espresso", price: 2.99, description: "Espresso is a concentrated coffee beverage...", imageName: "espresso", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Cappuccino", price: 3.99, description: "A Cappuccino is a classic espresso-based coffee drink...", imageName: "cappuccino", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Latte", price: 4.49, description: "A Latte is a popular espresso-based coffee drink...", imageName: "latte", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Espresso Con Panna", price: 2.99, description: "Espresso Con Panna is a delightful espresso-based drink...", imageName: "Espresso Kon - Pana", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Espresso Long", price: 4.49, description: "Espresso Long (also known as Lungo) is a type of espresso...", imageName: "Espresso Long", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Caramel Macchiato", price: 2.99, description: "A Caramel Macchiato is a delicious espresso-based drink...", imageName: "Caramel Makiato", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Mokka", price: 3.99, description: "A Mokka offers a perfect balance of the boldness of espresso...", imageName: "Mokka", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Americano", price: 4.49, description: "The Americano retains the deep, robust flavors of espresso...", imageName: "Americano", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Flat White", price: 2.99, description: "A Flat White is a smooth and velvety espresso-based drink...", imageName: "Flat White", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Latte Macchiato", price: 3.99, description: "A Latte Macchiato is the reverse of a traditional macchiato...", imageName: "Latte Makiato", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Hot Chocolate", price: 4.49, description: "Hot Chocolate is a rich and comforting drink made from...", imageName: "Hot Chocolate", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Iced Latte", price: 2.99, description: "An Iced Latte is a refreshing and smooth coffee drink...", imageName: "Ice Latte", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Iced Cappuccino", price: 3.99, description: "An Iced Cappuccino is a chilled version of the classic...", imageName: "Ice Cappucino", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Iced Americano", price: 4.49, description: "An Iced Americano is a simple and refreshing coffee drink...", imageName: "Ice Americano", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Ice Black Tea", price: 2.99, description: "Iced Black Tea is a refreshing and energizing drink...", imageName: "Ice Black Tea", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Ice Green Tea", price: 3.99, description: "Iced Green Tea is a light and refreshing beverage...", imageName: "Ice Green Tea", sizes: ["Small", "Medium", "Large"]),
        
        CoffeeItem(name: "Matcha Tea Latte", price: 4.49, description: "A Matcha Tea Latte is a creamy and vibrant green beverage...", imageName: "Matcha Tea Latte", sizes: ["Small", "Medium", "Large"])
    ]
    
    var body: some View {
        List(coffeeList) { coffee in
            NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
                HStack {
                    Image(coffee.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text(coffee.name)
                        .font(.headline)
                }
            }
        }
        .navigationTitle("Coffee Menu")
    }
}
