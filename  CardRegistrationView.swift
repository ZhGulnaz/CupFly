
import Foundation
import SwiftUI

struct CardRegistrationView: View {
    @State private var cardNumber = ""
    @State private var expiryDate = ""
    @State private var cvc = ""
    @State private var isRegistered = false

    var body: some View {
        VStack {
            // Title
            Text("Register Your Card")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            // Card Number Field
            TextField("Card Number", text: $cardNumber)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)

            // Expiry Date Field
            TextField("MM/YY", text: $expiryDate)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)

            // CVC Field
            TextField("CVC", text: $cvc)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)

            // Button for Registering Card
            Button(action: {
                // Here you would send the card data to your backend or payment processor
                registerCard()
            }) {
                Text("Register Card")
                    .font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top)

            if isRegistered {
                Text("Card Registered Successfully!")
                    .foregroundColor(.green)
                    .padding(.top)
            }

            Spacer()

        }
        .padding()
        .navigationTitle("Payment Information")
    }

    // Simulated registration process
    func registerCard() {
        // Simulate the card registration (e.g., sending data to the server)
        // You would typically use an API like Stripe to process payments
        isRegistered = true
        // Reset the fields
        cardNumber = ""
        expiryDate = ""
        cvc = ""
    }
}

struct CardRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        CardRegistrationView()
    }
}
