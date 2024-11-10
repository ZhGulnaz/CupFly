import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.5  // Начальный масштаб для анимации
    @State private var cups = [FlyingCup]()  // Массив стаканов с крыльями
    @State private var cupOffsets = [CGPoint]() // Массив для хранения offset для каждого стакана
    @State private var wingOffsets = [CGPoint]() // Массив для хранения offset для крыльев
    @EnvironmentObject var cartManager: CartManager  // Access CartManager

    @State private var isLongPressed = false  // Статус для зажатия кнопки

    var body: some View {
        NavigationView {
            ZStack {
                // Set a light blue background color
                Color.blue.opacity(0.1)  // Light blue with some transparency
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Logo or slogan with custom handwritten font (place it above cups)
                    Text("COFFEE OPENS UP")
                        .font(.custom("Pacifico", size: 30))  // Reduced font size
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 50)  // Adjust to place the text higher
                        .scaleEffect(scale)  // Apply scale animation
                        .opacity(Double(scale))  // Fade in as it scales up
                        .onAppear {
                            // Start scale animation when the view appears
                            withAnimation(.easeIn(duration: 1.0)) {
                                scale = 1.0
                            }
                        }

                    Spacer()  // This spacer ensures the text stays on top, cups move below

                    // "Next" button with scale and opacity animation
                    NavigationLink(destination: CoffeeListView()) { // Use NavigationLink to navigate to CoffeeListView
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .scaleEffect(isActive ? 1.2 : 1)  // Button scale effect
                            .opacity(isActive ? 0.8 : 1)  // Fade effect when pressed
                            .animation(.easeOut(duration: 0.3), value: isActive) // Button animation
                    }
                    .padding(.bottom, 40)
                    .zIndex(1)  // Ensure the button is above other elements
                    .simultaneousGesture(
                        LongPressGesture(minimumDuration: 1.0) // Detects when the button is long-pressed for 1 second
                            .onEnded { _ in
                                // If the button is long-pressed, transition to the next screen
                                isLongPressed = true
                            }
                    )
                }
                .transition(.opacity)  // Smooth transition between views
                .onAppear {
                    // Create multiple flying cups with different start positions and speeds
                    for _ in 0..<10 {  // Create 10 cups (you can change this number)
                        let cup = FlyingCup(startX: CGFloat.random(in: -300...300),
                                            startY: CGFloat.random(in: -100...100),
                                            endX: CGFloat.random(in: -300...300),
                                            endY: CGFloat.random(in: -300...300))
                        cups.append(cup)
                        cupOffsets.append(CGPoint(x: cup.startX, y: cup.startY)) // Initialize offsets
                        wingOffsets.append(CGPoint(x: cup.startX, y: cup.startY)) // Initialize wing offsets
                    }

                    // Start flying cup animation when the screen appears
                    withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                        for i in 0..<cups.count {
                            cupOffsets[i] = CGPoint(x: cups[i].endX, y: cups[i].endY)
                            wingOffsets[i] = CGPoint(x: cups[i].endX + CGFloat.random(in: -50...50), y: cups[i].endY + CGFloat.random(in: -50...50))
                        }
                    }

                    // Add animation for the initial appearance of the screen
                    withAnimation(.easeIn(duration: 1.5)) {
                        isActive = false
                    }
                }

                // Add flying coffee cups animation
                ForEach(0..<cups.count, id: \.self) { i in
                    ZStack {
                        // Coffee cup
                        Image(systemName: "cup.and.saucer.fill")  // Using a built-in cup image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.brown)  // Cup color
                            .offset(x: cupOffsets[i].x, y: cupOffsets[i].y)  // Apply the offset for movement
                            .animation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true), value: cupOffsets[i]) // Continuous movement

                        // Wings
                        Image(systemName: "flame.fill")  // Using a flame as wings (can be replaced with an actual wing image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)  // Wing color
                            .offset(x: wingOffsets[i].x, y: wingOffsets[i].y)  // Apply offset for wings
                            .animation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true), value: wingOffsets[i])  // Continuous wing movement
                    }
                }
            }
            .animation(.easeInOut(duration: 1.0), value: isActive)  // Apply animation to the transition
            .onChange(of: isLongPressed) { newValue in
                if newValue {
                    // Navigate to CoffeeListView on long press
                    isActive = true
                }
            }
        }
    }
}

struct FlyingCup {
    var startX: CGFloat
    var startY: CGFloat
    var endX: CGFloat
    var endY: CGFloat
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .environmentObject(CartManager())  // Make sure to provide the CartManager in the preview
    }
}
