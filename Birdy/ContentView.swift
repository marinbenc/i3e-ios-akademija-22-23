//
//  ContentView.swift
//  Birdy
//
//  Created by Marin Bencevic on 06.12.2022..
//

import SwiftUI

struct ContentView: View {

  @EnvironmentObject var tweetData: TweetData
  @EnvironmentObject var userData: UserData

  @State var content: String = ""
  @State var isLoginViewPresented = false

  var body: some View {
    VStack {
      HStack {
        Text(userData.username.isEmpty ? "Birdy" : userData.username)
          .font(.title)

        Spacer()

        Button(action: { isLoginViewPresented = true }) {
          Text("Login")
        }
      }

      Spacer()

      List($tweetData.tweets) { tweet in
        Tweet(tweet: tweet)
      }
      .listStyle(.plain)

      HStack {

        TextField("Content", text: $content)

        Button(action: {
          tweetData.tweets.append(TweetModel(
            content: content,
            username: "marinbenc",
            date: Date(),
            imageURL: IMAGE_URL))
          content = ""
        }) {
          Text("New Tweet")
        }
        .disabled(content.isEmpty)
      }

    }
    .padding()
    .sheet(isPresented: $isLoginViewPresented) {
      LoginView(content: $userData.username,
                isPresented: $isLoginViewPresented)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(TweetData())
      .environmentObject(UserData())
  }
}
