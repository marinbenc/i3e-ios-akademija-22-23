//
//  ContentView.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

struct ContentView: View {

  @State var tweets: [TweetModel] = [
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

  @State var username = ""

  @State var content: String = ""
  @State var isLoginViewPresented = false

  var body: some View {
    VStack {
      HStack {
        Text(username.isEmpty ? "Birdy" : username)
          .font(.title)

        Spacer()

        Button(action: { isLoginViewPresented = true }) {
          Text("Login")
        }
      }

      Spacer()

      List($tweets) { tweet in
        Tweet(tweet: tweet)
      }
      .listStyle(.plain)

      HStack {

        TextField("Content", text: $content)

        Button(action: {
          tweets.append(TweetModel(
            content: content,
            username: "marinbenc",
            date: Date(),
            image: "crow",
            isFavorite: false))
          content = ""
        }) {
          Text("New Tweet")
        }
        .disabled(content.isEmpty)
      }

    }
    .padding()
    .sheet(isPresented: $isLoginViewPresented) {
      LoginView(content: $username,
                isPresented: $isLoginViewPresented)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
