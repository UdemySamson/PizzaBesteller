//
//  ContentView.swift
//  PizzaBesteller
//
//  Created by Alexandre Samson on 09.05.25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pizza = Pizza()
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Wähle Deine Pizza aus", selection: $pizza.pizzaTypeIndex) {
                        ForEach(0..<Pizza.pizzaTypes.count, id: \.self) { index in// id: Добавил сам
                            Text(Pizza.pizzaTypes[index]).tag(index)
                        }
                    }
                    Stepper(value: $pizza.anzahl, in: 1...4) {
                        Text("Anzahl an Pizzen: \(pizza.anzahl)")
                    }
                }
                
                Section {
                    Picker("", selection: $pizza.pizzaSizeIndex) {
                        ForEach(0..<Pizza.pizzaSize.count, id: \.self) {
                            Text(Pizza.pizzaSize[$0]).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Lieferung")) {
                    Text("Lieferung...")
                }
                
            }
            .navigationBarTitle("Pizza Bestellen")
        }
    }
}

#Preview {
    ContentView()
}
