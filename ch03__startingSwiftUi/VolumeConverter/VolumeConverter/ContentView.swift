//
//  ContentView.swift
//  VolumeConverter
//
//  Created by Jamie Brannan on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
  @State var inputValue = 0
  @State var selectedInputUnit = 0
  @State var selectedOutputUnit = 1
  
  let unitOptions: [UnitVolume] = [.milliliters, .liters, .cups, .quarts, .pints, .gallons, .tablespoons, .teaspoons]
  
  var convertedValue: Double {
    let initial = Measurement(value: Double(inputValue), unit: unitOptions[selectedInputUnit])
    return initial.converted(to: unitOptions[selectedOutputUnit]).value
  }
  
  @FocusState private var amountIsFocused: Bool
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Value to convert", value: $inputValue, format: .number)
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
          Picker("unit", selection: $selectedInputUnit) {
            ForEach(0 ..< unitOptions.count, id: \.self) {
              Text(MeasurementFormatter().string(from: unitOptions[$0]))
            }
          }
        } header: {
          Text("What value would you like to convert?")
        }
        Section {
          Picker("target unit", selection: $selectedOutputUnit) {
            ForEach(0 ..< unitOptions.count, id: \.self) {
              Text(MeasurementFormatter().string(from: unitOptions[$0]))
            }
          }
        } header: {
          Text("What value are you targeting?")
        }
        Section {
          Text("\(convertedValue) \(MeasurementFormatter().string(from: unitOptions[selectedOutputUnit]))")
        }
      }
      .navigationTitle("Volume Converter")
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
