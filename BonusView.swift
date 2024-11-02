import SwiftUI

import SwiftUI

struct BonusView: View {
    let purchaseAmount: Double  // Сумма покупки
    
    var body: some View {
        VStack {
            Text("Congratulations!")
                .font(.largeTitle)
            
            // Расчёт бонуса (5% от суммы покупки)
            let bonus = purchaseAmount * 0.05
            
            Text("You've received a bonus of \(bonus, specifier: "%.2f")$")
                .font(.title2)
                .padding()
            
            Button(action: {
                // Возврат к главному меню или действие по бонусам
                // Например, можно использовать NavigationLink для возврата к главному экрану
            }) {
                Text("Go back to Menu")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Bonus")
    }
}
