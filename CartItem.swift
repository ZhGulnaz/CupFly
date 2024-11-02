//
//  CartItem.swift
//  CupFly
//
//  Created by Gulnaz Zhakhina on 20.10.2024.
//

import Foundation
struct CartItem: Identifiable {
    let id = UUID()
    let coffee: CoffeeItem
    let size: String
}
