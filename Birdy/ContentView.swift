//
//  ContentView.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

struct Bird {

  var greeting: String {
    return "Chirp!"
  }

  func greet() {
    print("Tweet!")
  }
}

struct ContentView: View {

  let tweets: [TweetModel] = [
    TweetModel(
      content: "Tweet 1",
      username: "username",
      date: Date(),
      image: "crow",
      isFavorite: true),
    TweetModel(
      content: "Tweet 2",
      username: "username",
      date: Date(),
      image: "crow",
      isFavorite: false),
  ]

  var body: some View {
    VStack {

      HStack {
        Text("Birdy")
          .font(.title)

        Spacer()

        Button(action: {}) {
          Text("Login")
        }
      }

      Spacer()

      List(tweets) { tweet in
        Tweet(tweet: tweet)
      }
      .listStyle(.plain)

    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
