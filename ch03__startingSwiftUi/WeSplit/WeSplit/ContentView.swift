//
//  ContentView.swift
//  WeSplit
//
//  Created by Jamie Brannan on 18/08/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  
  let tipPercentages = [10, 15, 20, 25, 0]
  @State private var tipPercentage = 10
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2) /// compensate for row offset
    let tipSelection = Double(tipPercentage)
    
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson
  }
  
  var grandTotal: Double {
    let tipValue = checkAmount / 100 * Double(tipPercentage)
    let grandTotal = checkAmount + tipValue
    
    return grandTotal
  }

  var localCurrency: FloatingPointFormatStyle<Double>.Currency {
    return .currency(code: Locale.current.currencyCode ?? "USD")
  }

  @FocusState private var amountIsFocused: Bool
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          // NB: this is only available in iOS 15
          TextField("Amount", value: $checkAmount, format: localCurrency )
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
        }
        Section {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(tipPercentages, id: \.self) {
              Text($0, format: .percent)
            }
          }
        } header: {
          Text("How much tip do you want to leave?")
        }
        Picker("Number of people", selection: $numberOfPeople) {
          ForEach(2 ..< 100) {
            Text("\($0) people")
          }
        }
        Section {
          Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
        } header: {
          Text("Total per person")
        }
        Section {
          Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
        } header: {
          Text("Grand total")
        }
      }
      .navigationTitle("WeSplit")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
