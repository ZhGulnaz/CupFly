
import Foundation
import SwiftUI

struct PaymentMethodView: View {
    @State private var selectedMethod: String? = nil
    
    var body: some View {
        VStack {
            Text("Select Payment Method")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Кнопки для выбора метода оплаты
            Button(action: {
                selectedMethod = "Card"
            }) {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .font(.title)
                    Text("Pay with Card")
                        .font(.title2)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom)
            }
            
            Button(action: {
                selectedMethod = "PayPal"
            }) {
                HStack {
                    Image(systemName: "paypal")
                        .font(.title)
                    Text("Pay with PayPal")
                        .font(.title2)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            // Переход на страницу регистрации карты, если выбран способ "Card"
            if selectedMethod == "Card" {
                NavigationLink(destination: CardRegistrationView()) {
                    Text("Proceed to Card Registration")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
            }
            
            Spacer()
        }
        .navigationTitle("Payment Options")
        .padding()
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}
