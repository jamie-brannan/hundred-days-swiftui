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
  @State var tipPercentage: Int = 10
  var body: some View {
    NavigationView {
      Form {
        Section {
          // NB: this is only available in iOS 15
          TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            .keyboardType(.decimalPad)
        }
        Section {
            Picker("Tip percentage", selection: $tipPercentage) {
                ForEach(tipPercentages, id: \.self) {
                    Text($0, format: .percent)
                }
            }
            .pickerStyle(.segmented)
        } header: {
            Text("How much tip do you want to leave?")
        }
        Picker("Number of people", selection: $numberOfPeople) {
          ForEach(2 ..< 100) {
            Text("\($0) people")
          }
        }
      }
      .navigationTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
