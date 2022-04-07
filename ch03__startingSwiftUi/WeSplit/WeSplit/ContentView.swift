//
//  ContentView.swift
//  WeSplit
//
//  Created by Jamie Brannan on 18/08/2021.
//

import SwiftUI

struct ContentView: View {
  @State var name = ""

  var body: some View {
    Form {
        TextField("Enter your name", text: $name)
        Text("Hello, \(name)!")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
