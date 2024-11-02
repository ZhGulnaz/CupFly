//
//  CupFlyApp.swift
//  CupFly
//
//  Created by Gulnaz Zhakhina on 07.09.2024.
//

import SwiftUI

@main
struct CupFlyApp: App {
    @StateObject private var cartManager = CartManager()  // Инициализация CartManager
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)  // Передача CartManager через EnvironmentObject
        }
    }
}
