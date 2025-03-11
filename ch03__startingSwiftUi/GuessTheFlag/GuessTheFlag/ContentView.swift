//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jamie Marie Brannan on 11/08/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
        VStack(spacing: 0) {
            Color.red
            Color.blue
        }

        Text("Your content")
            .foregroundColor(.secondary)
            .padding(50)
            .background(.ultraThinMaterial)
    }
    .ignoresSafeArea()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
