//
//  ContentView.swift
//  WeSplit
//
//  Created by Jamie Brannan on 18/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Form {
          Group {
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
          }

          Group {
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
              Text("Hello World")
          }
      }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
