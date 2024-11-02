import SwiftUI

struct CoffeeDetailView: View {
    @EnvironmentObject var cartManager: CartManager  // Подключаем CartManager
    @State private var selectedSize: String = "Medium"  // По умолчанию выбрана "Medium"
    let coffee: CoffeeItem
    
    var body: some View {
        VStack {
            // Отображаем изображение кофе
            Image(coffee.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding()
            
            // Название кофе
            Text(coffee.name)
                .font(.largeTitle)
                .padding()
            
            // Описание кофе
            Text(coffee.description)
                .padding()

            // Отображаем кнопки для выбора размера
            HStack {
                ForEach(coffee.sizes, id: \.self) { size in
                    Button(action: {
                        selectedSize = size  // При нажатии изменяем выбранный размер
                    }) {
                        Text(size)
                            .padding()
                            .background(selectedSize == size ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()

            // Показываем выбранный размер и цену
            Text("Selected size: \(selectedSize)")
            Text("Price: $\(coffee.price, specifier: "%.2f")")
            
            Spacer()

            // Кнопка "Add to Cart"
            Button(action: {
                // Добавляем товар с выбранным размером в корзину
                cartManager.addToCart(coffee: coffee, size: selectedSize)
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(7)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(coffee.name)
    }
}
