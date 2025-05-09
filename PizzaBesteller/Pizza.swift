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
    
    @Published var anzahl = 1
    
    static let pizzaSize = ["Klein", "Mittel", "Groß"]
    @Published var pizzaSizeIndex = 0
    
    @Published var name = ""
    @Published var streetAdresse = ""
    @Published var city = ""
    
    var isInvalid: Bool {
        name.isEmpty || streetAdresse.isEmpty || city.isEmpty
    }
}
