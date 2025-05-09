//
//  Pizza.swift
//  PizzaBesteller
//
//  Created by Alexandre Samson on 09.05.25.
//

import Foundation

class Pizza: ObservableObject {
    static let pizzaTypes = ["Salami", "Funghi", "Margherita", "Mozzarella", "Etna", "Tonno", "Ragu", "Peperoni"]
    
    @Published var pizzaTypeIndex = 0
}
