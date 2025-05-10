//
//  ContentView.swift
//  PizzaBesteller
//
//  Created by Alexandre Samson on 09.05.25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var pizza = Pizza()
    @State var showingConfirmation = false
    
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
                        ForEach(0..<Pizza.pizzaSizes.count, id: \.self) {
                            Text(Pizza.pizzaSizes[$0]).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Lieferung")) {
                    TextField("Name", text: $pizza.name)
                    TextField("Adresse", text: $pizza.streetAddress)
                    TextField("Stadt", text: $pizza.city)
                }
                
                Section {
                    Button(action: {showingConfirmation = true}) {
                        Text("Kostenpflichtig bestellen")
                    }.disabled(pizza.isInvalid)
                }
            }
            .navigationBarTitle("Pizza Bestellen")
            .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Vielen Dank für Ihre Bestellung!"), message: Text("Ihre Bestellung (\(pizza.anzahl) x Pizza \(Pizza.pizzaTypes[pizza.pizzaTypeIndex]) in der Größe \(Pizza.pizzaSizes[pizza.pizzaSizeIndex]) wird in kürze an die folgende Adresse geliefert:\nName:  \(pizza.name)\nStraße: \(pizza.streetAddress)\nStadt: \(pizza.city)"), dismissButton: .cancel())
            }
        }
    }
}

#Preview {
    ContentView()
}
