import SwiftUI

struct PaymentView: View {
    @State private var paymentInProgress = false
    @State private var paymentSuccessful = false
    @State private var purchaseAmount: Double = 100.0  // Примерная сумма покупки
    
    var body: some View {
        VStack {
            Text("Payment")
                .font(.largeTitle)
            
            if paymentInProgress {
                ProgressView("Processing Payment...")
            } else if paymentSuccessful {
                NavigationLink(destination: BonusView(purchaseAmount: purchaseAmount)) {
                    Text("View Bonus")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            } else {
                Button(action: {
                    performPayment()
                }) {
                    Text("Complete Payment")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Payment")
    }
    
    func performPayment() {
        paymentInProgress = true
        
        // Имитация вызова API для платежей
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            paymentInProgress = false
            paymentSuccessful = true
        }
    }
}
