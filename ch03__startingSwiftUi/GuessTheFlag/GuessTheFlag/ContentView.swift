//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jamie Marie Brannan on 11/08/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack {
      HelloColumn()
      HelloColumn()
      HelloColumn()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct HelloWorldHStack: View {
  var body: some View {
    HStack {
      Text("Hello, world!")
      Text("This is inside a stack")
    }
  }
}

struct HelloColumn: View {
  var body: some View {
    VStack {
      HelloWorldHStack()
      HelloWorldHStack()
      HelloWorldHStack()
    }
  }
}
