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
                Picker("Wähle Deine Pizza aus", selection: $pizza.pizzaTypeIndex) {
                    ForEach(0..<Pizza.pizzaTypes.count, id: \.self) { index in// id: Добавил сам
                        Text(Pizza.pizzaTypes[index]).tag(index)
                    }
                }
            }
            .navigationBarTitle("Pizza Bestellen")
        }
    }
}

#Preview {
    ContentView()
}
