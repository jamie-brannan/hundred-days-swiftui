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
  
  var body: some View {
    Form {
      Section {
        // NB: this is only available in iOS 15
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
          .keyboardType(.decimalPad)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
