//
//  ContentView.swift
//  WeSplit
//
//  Created by Jamie Brannan on 18/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
          Form {
              Section {
                  Text("Hello World")
              }
          }.navigationBarTitle("SwiftUI")

      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
