//
//  ContentView.swift
//  Project2
//
//  Created by Paul Hudson on 17/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  /// This is the answer to the question and the country that'll be selected
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var roundsRemaining = 8
  
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var scoreMessage = ""
  @State private var runningScore: Int = 0
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(.white)
          
          Text(countries[correctAnswer])
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
        
        ForEach(0 ..< 3) { number in
          Button(action: {
            self.flagTapped(number)
          }) {
            Image(self.countries[number])
              .renderingMode(.original)
              .clipShape(Capsule())
              .overlay(Capsule().stroke(Color.black, lineWidth: 1))
              .shadow(color: .black, radius: 2)
          }
        }
        
        Spacer()
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(
        title: Text(scoreTitle),
        message:
          Text("Your score is \(runningScore)\n \(String(describing: scoreMessage))")
        ,
        dismissButton: .default(
          Text("Continue")) { self.askQuestion()}
      )
    }
  }
  
  func flagTapped(_ number: Int) {
    guard roundsRemaining > 1 else {
      scoreTitle = "The End"
      scoreMessage = "Want to play again?"
      showingScore = true
      return
    }
    roundsRemaining -= 1
    if number == correctAnswer {
      scoreTitle = "Correct"
      runningScore += 1
      scoreMessage = ""
    } else {
      scoreTitle = "Wrong"
      runningScore -= 1
      scoreMessage = "Wrong! That’s the flag of \(countries[correctAnswer])"
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
